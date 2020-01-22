const db = require("../data/db-config");

function find() {
  return db("schemes");
}

function findById(id) {
  return db("schemes")
    .where({ id })
    .first();
}

function findSteps(id) {
  return db("steps").where({ scheme_id: id });
}

module.exports = {
  find,
  findById,
  findSteps
  //   add,
  //   addStep,
  //   update,
  //   remove
};
