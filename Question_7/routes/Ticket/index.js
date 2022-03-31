var express = require("express");
let router = express.Router();
var mysql = require("../database");
var server = new mysql();

router.route("/user-like").get((req, res) => {
  server.query(
    "select * from User_like as ul inner join event as e on e.category = ul.category inner join ticket_type as tt on e.id = tt.event_id WHERE e.start_datetime BETWEEN NOW() - INTERVAL 60 DAY AND NOW()",
    (err, rows) => {
      if (err) {
        res.status(400).json({
          status: 400,
          data: rows,
          error: err,
          message: "Failed to GET the Ticket ",
        });
      } else {
        let tmp = [];
        let remainingCapacitytmp = 1000;
        const json = {
          id: rows[0].event_id,
          name: rows[0].name,
          start_datetime: rows[0].start_datetime,
        };
        rows.forEach((element) => {
          remainingCapacitytmp = remainingCapacitytmp - element.capacity;
          tmp = [
            ...tmp,
            {
              id: element.id,
              name: element.ticket_name,
              price: element.price,
              capacity: element.capacity,
              remainingCapacity: remainingCapacitytmp,
            },
          ];
        });
        json.ticket_types = tmp;
        res.status(200).json({
          status: 200,
          data: json,
          message: "Success to GET the Ticket ",
        });
      }
    }
  );
});

module.exports = router;
