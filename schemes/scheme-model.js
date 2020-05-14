const db = require("../data/db-config")

module.exports = {
    find,
    findById,
    findSteps,
    add,
    addStep,
    update,
    remove
}
//GET
function find() {
    return db("schemes")
}
function findById(id) {
    return db("schemes")
        .where({ id })
        .first()
}
function findSteps(input_id) {
    return db('schemes as s')
    .join('steps as u', 'u.scheme_id', 's.id')
    .select('u.id', 's.scheme_name', 'u.instructions')
    .where('s.id', input_id)
    .orderBy('u.id');
}
//POST
function add(scheme) {
    return db("schemes")
      .insert(scheme, "id")
      .then(ids => {
        return findById(ids[0]);
      });
  }
  function addStep(step) {
    return db("steps")
      .insert(step, "id")
      .then(ids => {
        return findSteps(ids[0]);
      });
  }
  /*
  db('users') => a promise that resolves to a user
  findById  => a promise that resolves to a user
  add  => a promise that resolves to a user
  post
  */

//UD
function update(id, changes) {
    return db("schemes")
        .where({ id })
        .update(changes)
}
function remove(id) {
    return db("schemes")
        .where({ id })
        .del()
}