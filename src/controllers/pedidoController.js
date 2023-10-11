function pedido(req, res) {
  req.getConnection((err, conn) => {
    conn.query('SELECT a.folio, b.id_status, b.tip_status FROM pedido a, status b WHERE a.id_status=b.id_status', (err, pedi) => {
      if(err) {
        res.json(err);
      }
      console.log("--------",pedi)
      res.render('pages/pedido', { pedi });
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
    conn.query('UPDATE pedido SET id_status=2', )
  })
}






module.exports = {
 detalle:detalle,
 pedido,
 aceptar,

}