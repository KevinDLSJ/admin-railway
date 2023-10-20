function pedido(req, res) {
  req.getConnection((err, conn) => {
    conn.query('SELECT b.folio,b.fecha,d.tip_status FROM pedido b JOIN status d ON b.id_status=d.id_status WHERE b.id_status=1', (err, pedi) => {
      if(err) {
        res.json(err);
      }
      console.log("--------",pedi)
      res.render('pages/pedidos', { pedi });
    });
  });
}


function detalle(req, res) {
  req.getConnection((err, conn) => {
    conn.query('SELECT b.folio, c.name, a.cantidad, a.precio FROM pedido b JOIN detalle a ON a.folio = b.folio JOIN product c ON a.id_producto = c.id_producto;', (err, deta) => {
      if(err) {
        res.json(err);
      }
      console.log("--------", deta)
      res.render('pages/detalle', {deta})
    })
  })
}

function aceptar (req, res) {
  req.getConnection((err, conn) =>{
    conn.query('UPDATE pedido SET tip_status=4', (err, pers) => {
      if(err) {
        res.json(err);
      }
      res.render('pages/pedidos', { pers });
    })
  })
}

function terminado(req, res) {
  req.getConnection((err, conn) => {
    conn.query('SELECT b.folio, b.fecha, b.corre_emp, b.correo_clie, d.tip_status FROM pedido b JOIN status d ON b.id_status = d.id_status WHERE  b.id_status = 2', (err, pedi) => {
      if(err) {
        res.json(err);
      }
      console.log("--------",pedi)
      res.render('pages/terminado', { pedi });
    });
  });
}

function pagado(req, res) {
  req.getConnection((err, conn) => {
    conn.query('SELECT b.folio, b.fecha, b.corre_emp, b.correo_clie, d.tip_status FROM pedido b JOIN status d ON b.id_status = d.id_status WHERE b.id_status = 3', (err, pedi) => {
      if(err) {
        res.json(err);
      }
      console.log("--------",pedi)
      res.render('pages/pagado', { pedi });
    });
  });
}

function entregado(req, res) {
  req.getConnection((err, conn) => {
    conn.query('SELECT b.folio, b.fecha, b.corre_emp, b.correo_clie, d.tip_status FROM pedido b JOIN status d ON b.id_status = d.id_status WHERE b.id_status = 4', (err, pedi) => {
      if(err) {
        res.json(err);
      }
      console.log("--------",pedi)
      res.render('pages/entregado', { pedi });
    });
  });
}






module.exports = {
 detalle:detalle,
 pedido,
 aceptar,
 terminado,
 pagado,
 entregado,

}