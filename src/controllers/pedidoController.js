function pedido(req, res) {
  req.getConnection((err, conn) => {
    conn.query('SELECT b.folio, c.id_producto, a.cantidad, a.precio FROM detalle a, pedido b, product c WHERE a.folio=b.folio and a.id_producto=c.id_producto', (err, pedi) => {
      if(err) {
        res.json(err);
      }
      console.log("--------",pedi)
      res.render('pages/pedido', { pedi });
    });
  });
}

module.exports = {
  pedido,
}