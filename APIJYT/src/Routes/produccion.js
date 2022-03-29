const express = require ('express');
const router = express.Router();
const Dbhelper = require ("../../herramientas/dbhelper");
const RespuestaHttp = require("../../herramientas/respuesta");
const { validarToken } = require('../../herramientas/token');

/*************************************************************************************************
**************************************************************************************************
**************************************************************************************************
MODULO PRODUCCION
**************************************************************************************************
**************************************************************************************************
**************************************************************************************************/
//TABLA PRODUCTOS
//SELECT DE TODOS LOS DATOS DE LA TABLA PRODUCTOS
router.get('/productos',validarToken,async (req, res) => {

    const dbHelper = new Dbhelper();
    const resHttp = new RespuestaHttp();
    try {

        const datos = await dbHelper.query('CALL mp_sel_todo_prodcutos;');
        resHttp.respuesta = datos;
        return res.status(200).send(resHttp);

    } catch ({ message }) {
        resHttp.existeError = true;
        resHttp.mensaje = message;
        return res.status(400).send(resHttp);
    }
});

//SELECT DE LA TABLA PRODUCTOS
router.get('/productos/:cod_producto',validarToken,async (req, res) => {
    const { cod_producto } = req.params;

    const dbHelper = new Dbhelper();
    const resHttp = new RespuestaHttp();

    const datos = await dbHelper.query('CALL mp_sel_productos (?);', [cod_producto]);
    try {
    if (datos.length === 0) {
        resHttp.existeError = true;
        resHttp.mensaje = "No se encontro el producto";
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

//DELETE TABLA PRODUCTOS
router.delete('/productos/eliminar/:cod_producto',validarToken,async(req,res)=>{
    const {cod_producto}=req.params;

    const dbHelper = new Dbhelper();
    const resHttp = new RespuestaHttp();
    try {

        const respuesta = await dbHelper.query('CALL mp_del_productos (?);', [cod_producto]);

        resHttp.respuesta = respuesta;
        resHttp.mensaje = "Producto eliminado correctamente";
        return res.status(200).send(resHttp);

    } catch ({ message }) {
        resHttp.existeError = true;
        resHttp.mensaje = message;
        return res.status(400).send(resHttp);
    }
});

//INSERT TABLA PRODUCTOS
router.post('/productos/insertar',validarToken,async(req,res)=>{
    const{cod_producto,nombre_producto,descrip_producto,precio_producto} =req.body;

    const dbHelper = new Dbhelper();
    const httpRes = new RespuestaHttp();
    try {

        const venta = await dbHelper.query('CALL mp_ins_productos (?,?,?,?);', 
        [cod_producto,nombre_producto,descrip_producto,precio_producto]);

        httpRes.respuesta = venta;
        httpRes.mensaje = "Producto creado";
        return res.status(200).send(httpRes);

    } catch ({ message }) {
        httpRes.existeError = true;
        httpRes.mensaje = message;
        return res.status(400).send(httpRes);
    }
});

//UPDATE TABLA PRODUCTOS
router.put('/productos/actualizar',validarToken,async (req, res) => {
    const{cod_producto,nombre_producto,descrip_producto,precio_producto} = req.body;
   
    const dbHelper = new Dbhelper();
    const httpRes = new RespuestaHttp();

    try {

        const venta_actualizar = await dbHelper.query("CALL mp_upd_productos(?,?,?,?);", 
        [cod_producto,nombre_producto,descrip_producto,precio_producto]);

        httpRes.respuesta = venta_actualizar;
        httpRes.mensaje = "Producto actualizado";
        return res.status(200).send(httpRes);

    } catch ({ message }) {
        httpRes.existeError = true;
        httpRes.mensaje = message;
        return res.status(400).send(httpRes);
    }
});

//TABLA PRODUCTOS INVENTARIOS
//SELECT DE TODOS LOS DATOS DE LA TABLA PRODUCTOS
router.get('/productos_inventarios',validarToken,async (req, res) => {

    const dbHelper = new Dbhelper();
    const resHttp = new RespuestaHttp();
    try {

        const datos = await dbHelper.query('CALL mp_sel_todo_inventario_prodcutos;');
        resHttp.respuesta = datos;
        return res.status(200).send(resHttp);

    } catch ({ message }) {
        resHttp.existeError = true;
        resHttp.mensaje = message;
        return res.status(400).send(resHttp);
    }
});

//SELECT DE LA TABLA PRODUCTOS INVENTARIOS
router.get('/productos_inventarios/:cod_lote',validarToken,async (req, res) => {
    const { cod_lote } = req.params;

    const dbHelper = new Dbhelper();
    const resHttp = new RespuestaHttp();

    const datos = await dbHelper.query('CALL mp_sel_inventario_productos (?);', [cod_lote]);
    try {
    if (datos.length === 0) {
        resHttp.existeError = true;
        resHttp.mensaje = "No se encontro el producto en inventario";
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

//DELETE TABLA PRODUCTOS INVENTARIOS
router.delete('/productos_inventarios/eliminar/:cod_lote',validarToken,async(req,res)=>{
    const {cod_lote}=req.params;

    const dbHelper = new Dbhelper();
    const resHttp = new RespuestaHttp();
    try {

        const respuesta = await dbHelper.query('CALL mp_del_inventario_productos (?);', [cod_lote]);

        resHttp.respuesta = respuesta;
        resHttp.mensaje = "Producto en inventario eliminado correctamente";
        return res.status(200).send(resHttp);

    } catch ({ message }) {
        resHttp.existeError = true;
        resHttp.mensaje = message;
        return res.status(400).send(resHttp);
    }
});

//INSERT TABLA PRODUCTOS INVENTARIOS
router.post('/productos_inventarios/insertar',validarToken,async(req,res)=>{
    const{cod_lote,cod_producto,fech_creacion_lote,fech_caducidad_lote,cant_lote,prec_vent_lote} =req.body;

    const dbHelper = new Dbhelper();
    const httpRes = new RespuestaHttp();
    try {

        const venta = await dbHelper.query('CALL mp_ins_inventario_productos (?,?,?,?,?,?);', 
        [cod_lote,cod_producto,fech_creacion_lote,fech_caducidad_lote,cant_lote,prec_vent_lote]);

        httpRes.respuesta = venta;
        httpRes.mensaje = "Producto en inventario creada";
        return res.status(200).send(httpRes);

    } catch ({ message }) {
        httpRes.existeError = true;
        httpRes.mensaje = message;
        return res.status(400).send(httpRes);
    }
});

//UPDATE TABLA PRODUCTOS INVENTARIOS
router.put('/productos_inventarios/actualizar',validarToken,async (req, res) => {
    const{cod_lote,cod_producto,fech_creacion_lote,fech_caducidad_lote,cant_lote,prec_vent_lote} = req.body;
   
    const dbHelper = new Dbhelper();
    const httpRes = new RespuestaHttp();

    try {

        const venta_actualizar = await dbHelper.query("CALL mp_upd_inventario_productos (?,?,?,?,?,?);", 
        [cod_lote,cod_producto,fech_creacion_lote,fech_caducidad_lote,cant_lote,prec_vent_lote]);

        httpRes.respuesta = venta_actualizar;
        httpRes.mensaje = "Producto en inventario actualizado";
        return res.status(200).send(httpRes);

    } catch ({ message }) {
        httpRes.existeError = true;
        httpRes.mensaje = message;
        return res.status(400).send(httpRes);
    }
});

module.exports=router;