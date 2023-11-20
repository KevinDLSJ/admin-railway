function reporteventa(req,res){
    res.render('pages/reporteventa');
}

function fechadia(req, res){
    const id = req.params.id
    //const name = req.oidc.user.email
    const data = req.body;

    req.getConnection((err, conn) => {
        conn.query('SELECT b.fecha, SUM(a.cantidad * c.precio) FROM detalle a JOIN pedido b ON a.folio = b.folio JOIN product c ON c.id_producto = a.id_producto WHERE b.fecha = date("2023/10/25") GROUP BY b.fecha', [data.fecha] , (err, hoy) => {
            console.log('fecha:',hoy)
            //res.render('pages/reporteventa', {hoy})
            req.getConnection((err,conn) => {
                conn.query('SELECT b.fecha, SUM(a.cantidad * c.precio) FROM detalle a JOIN pedido b ON a.folio = b.folio JOIN product c ON c.id_producto = a.id_producto WHERE b.fecha = date("2023/10/25") GROUP BY b.fecha',[id],(err,tota) =>{
                  const to = tota[0]["SUM(a.cantidad * c.precio)"]
                  res.render('pages/reporteventa',{hoy,total: to})
                  console.log(to, '---------')
                })
              })
        })
    });
}

module.exports ={
    reporteventa,
    fechadia,
}