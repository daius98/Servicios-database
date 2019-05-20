const express = require('express');
const router = express.Router();

const mysqlConnection  = require('../db');

// GET all users
router.get('/', (req, res) => {
  mysqlConnection.query('SELECT * FROM usuarios', (err, rows, fields) => {
    if(!err) {
      res.json(rows);
    } else {
      console.log(err);
    }
  });  
});

// GET An user
router.get('/:id', (req, res) => {
  const { id } = req.params; 
  mysqlConnection.query('SELECT * FROM usuarios WHERE usuarios_id = ?', [id], (err, rows, fields) => {
    if (!err) {
      res.json(rows);
    } else {
      console.log(err);
    }
  });
});

// DELETE An user
router.delete('/:id', (req, res) => {
  const { id } = req.params;
  mysqlConnection.query('DELETE FROM usuarios WHERE usuarios_id = (?)', [id], (err, rows, fields) => {
    if(!err) {
      res.json({status: 'Usuario Deleted'});
    } else {
      console.log(err);
    }
  });
});

// INSERT An user
router.post('/', (req, res) => {
  const {id, username, email} = req.body;
  console.log(id, username, email);
  const query = `
    CALL usuariosAddOrEdit(?, ?, ?);
  `;
  mysqlConnection.query(query, [id, username, email], (err, rows, fields) => {
    if(!err) {
      res.json({status: 'Usuarios Saved'});
    } else {
      console.log(err);
    }
  });

});

router.put('/:id', (req, res) => {
  const { name, salary } = req.body;
  const { id } = req.params;
  const query = `

    CALL UsuarioAddOrEdit(?,?,?);
  `;
  mysqlConnection.query(query, [id, name, salary], (err, rows, fields) => {
    if(!err) {
      res.json({status: 'Usuario Updated'});
    } else {
      console.log(err);
    }
  });
});

module.exports = router;