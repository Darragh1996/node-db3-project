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

function add({ scheme_name }) {
  return db("schemes").insert({ scheme_name });
}

function addStep(stepData, id) {
  return db("steps").insert({ scheme_id: id, ...stepData });
}

function update(changes, id) {
  return db("schemes")
    .where({ id })
    .update({ ...changes });
}

function remove(id) {
  return db("schemes")
    .where({ id })
    .del();
}

module.exports = {
  find,
  findById,
  findSteps,
  add,
  addStep,
  update,
  remove
};
