const express = require ('express');
const router = express.Router();
const Dbhelper = require ("../../herramientas/dbhelper");
const RespuestaHttp = require("../../herramientas/respuesta");
const { validarToken } = require('../../herramientas/token');

/*************************************************************************************************
**************************************************************************************************
**************************************************************************************************
MODULO VENTAS
**************************************************************************************************
**************************************************************************************************
**************************************************************************************************/
//TABLA VENTAS
//SELECT DE TODOS LOS DATOS DE LA TABLA VENTA
router.get('/ventas', validarToken ,async (req, res) => {

    const dbHelper = new Dbhelper();
    const resHttp = new RespuestaHttp();

    const datos = await dbHelper.query('CALL mv_sel_todo_ventas;');
    resHttp.respuesta = datos;
    return res.status(200).send(resHttp);


});

//SELECT DE LA TABLA VENTA
router.get('/ventas/:cod_venta',validarToken, async (req, res) => {

    const { cod_venta } = req.params;

    const dbHelper = new Dbhelper();
    const resHttp = new RespuestaHttp();

    const datos = await dbHelper.query('CALL mv_sel_ventas (?);', [cod_venta]);
    try {
    if (datos.length === 0) {
        resHttp.existeError = true;
        resHttp.mensaje = "No se encontro la venta";
        return res.status(400).send(resHttp);
    }
    resHttp.respuesta = datos;
    return res.status(200).send(resHttp);

    } catch ({ message }) {
    resHttp.existeError = true;
    resHttp.mensaje = message;
    return res.status(400).send(resHttp);
    }
});

//DELETE TABLA VENTAS
router.delete('/ventas/eliminar/:cod_venta',validarToken, async (req,res)=>{

    const {cod_venta}=req.params;

    const dbHelper = new Dbhelper();
    const resHttp = new RespuestaHttp();
    try {

        const respuesta = await dbHelper.query('CALL mv_del_ventas (?);', [cod_venta]);

        resHttp.respuesta = respuesta;
        resHttp.mensaje = "Venta eliminada correctamente";
        return res.status(200).send(resHttp);

    } catch ({ message }) {
        resHttp.existeError = true;
        resHttp.mensaje = message;
        return res.status(400).send(resHttp);
    }
});

//INSERT TABLA VENTA
router.post('/ventas/insertar',validarToken,async(req,res)=>{

    const{cod_venta,cod_usuario,cliente_id,fecha_creacion} =req.body;

    const dbHelper = new Dbhelper();
    const httpRes = new RespuestaHttp();
    try {

        const venta = await dbHelper.query('CALL mv_ins_ventas (?,?,?,?);', [cod_venta,cod_usuario,cliente_id,fecha_creacion]);

        httpRes.respuesta = venta;
        httpRes.mensaje = "Venta creada";
        return res.status(200).send(httpRes);

    } catch ({ message }) {
        httpRes.existeError = true;
        httpRes.mensaje = message;
        return res.status(400).send(httpRes);
    }
});

//UPDATE TABLA VENTAS
router.put('/ventas/actualizar',validarToken,async (req, res) => {

    const{cod_venta,cod_usuario,cliente_id} = req.body;

    const dbHelper = new Dbhelper();
    const httpRes = new RespuestaHttp();

    try {

        const venta_actualizar = await dbHelper.query("CALL mv_upd_ventas(?,?,?);", [cod_venta,cod_usuario,cliente_id]);

        httpRes.respuesta = venta_actualizar;
        httpRes.mensaje = "Venta actualizada";
        return res.status(200).send(httpRes);

    } catch ({ message }) {
        httpRes.existeError = true;
        httpRes.mensaje = message;
        return res.status(400).send(httpRes);
    }
});

//TABLA DETALLE VENTA
//SELECT DE TODOS LOS DATOS DE LA TABLA DETALLE VENTA
router.get('/detalle_venta', async (req, res) => {

    const dbHelper = new Dbhelper();

    const datos = await dbHelper.query('CALL mv_sel_todo_detalle_ventas;', (err, 
        rows, fields) => {
        if (!err) {
            res.json(rows[0]);
        } else {
            console.log(err);
        }
    });

});

//SELECT DE LA TABLA DETALLE VENTA
router.get('/detalle_venta/:cod_detalle_venta', async (req, res) => {
    const { cod_detalle_venta } = req.params;

    const dbHelper = new Dbhelper();
    const resHttp = new RespuestaHttp();

    const datos = await dbHelper.query('CALL mv_sel_detalle_venta (?);', [cod_detalle_venta]);

    if (datos.length === 0) {
        resHttp.existeError = true;
        resHttp.mensaje = "No se encontro el detalle de  venta";
        return res.status(400).send(resHttp);
    }
    resHttp.respuesta = datos;
    return res.status(200).send(resHttp);
});

//DELETE TABLA DETALLE VENTA
router.delete('/detalle_venta/eliminar/:cod_detalle_venta',validarToken,async(req,res)=>{

    const {cod_detalle_venta}=req.params;

    const dbHelper = new Dbhelper();
    const resHttp = new RespuestaHttp();
    try {

        const respuesta = await dbHelper.query('CALL mv_del_detalle_ventas (?);', [cod_detalle_venta]);

        resHttp.respuesta = respuesta;
        resHttp.mensaje = "Detalle de Venta eliminado correctamente";
        return res.status(200).send(resHttp);

    } catch ({ message }) {
        resHttp.existeError = true;
        resHttp.mensaje = message;
        return res.status(400).send(resHttp);
    }
});

//INSERT TABLA DETALLE VENTA
router.post('/detalle_venta/insertar',validarToken,async(req,res)=>{
    const{cod_detalle_venta,cod_venta,cod_producto,cantidad,precio_venta,descuento,impuesto_sobre_venta,subtotal} =req.body;

    const dbHelper = new Dbhelper();
    const httpRes = new RespuestaHttp();
    try {

        const venta = await dbHelper.query('CALL mv_ins_detalle_ventas (?,?,?,?,?,?,?,?);', 
        [cod_detalle_venta,cod_venta,cod_producto,cantidad,precio_venta,descuento,impuesto_sobre_venta,subtotal]);

        httpRes.respuesta = venta;
        httpRes.mensaje = "Detalle de Venta creada";
        return res.status(200).send(httpRes);

    } catch ({ message }) {
        httpRes.existeError = true;
        httpRes.mensaje = message;
        return res.status(400).send(httpRes);
    }
});

//UPDATE TABLA DETALLE VENTAS
router.put('/detalle_venta/actualizar',validarToken,async (req, res) => {
    const{cod_detalle_venta,cod_venta,cod_producto,cantidad,precio_venta,descuento,impuesto_sobre_venta,subtotal} = req.body;
    const query ='CALL mv_upd_detalle_ventas(?,?,?,?,?,?,?,?);'
   
    const dbHelper = new Dbhelper();
    const httpRes = new RespuestaHttp();

    try {

        const venta_actualizar = await dbHelper.query("CALL mv_upd_detalle_ventas(?,?,?,?,?,?,?,?);", 
        [cod_detalle_venta,cod_venta,cod_producto,cantidad,precio_venta,descuento,impuesto_sobre_venta,subtotal]);

        httpRes.respuesta = venta_actualizar;
        httpRes.mensaje = "Detalle de Venta actualizada";
        return res.status(200).send(httpRes);

    } catch ({ message }) {
        httpRes.existeError = true;
        httpRes.mensaje = message;
        return res.status(400).send(httpRes);
    }
});

module.exports=router;