const express = require ('express');
const router = express.Router();
const Dbhelper = require ("../../herramientas/dbhelper");
const RespuestaHttp = require("../../herramientas/respuesta");
const { validarToken } = require('../../herramientas/token');

/*************************************************************************************************
**************************************************************************************************
**************************************************************************************************
MODULO INVENTARIO
**************************************************************************************************
**************************************************************************************************
**************************************************************************************************/
//TABLA MATERIA PRIMA
//SELECT DE TODOS LOS DATOS DE LA TABLA MATERIA PRIMA
router.get('/inventario_materia',validarToken,async (req, res) => {

    const dbHelper = new Dbhelper();
    const resHttp = new RespuestaHttp();
    try {

        const datos = await dbHelper.query('CALL mi_sel_todo_materia_prima;');
        resHttp.respuesta = datos;
        return res.status(200).send(resHttp);

    } catch ({ message }) {
        resHttp.existeError = true;
        resHttp.mensaje = message;
        return res.status(400).send(resHttp);
    }
});

//SELECT DE LA TABLA MATERIA PRIMA
router.get('/inventario_materia/:cod_materia',validarToken,async (req, res) => {
    const { cod_materia } = req.params;

    const dbHelper = new Dbhelper();
    const resHttp = new RespuestaHttp();

    const datos = await dbHelper.query('CALL mi_sel_materia_prima (?);', [cod_materia]);
    try {
    if (datos.length === 0) {
        resHttp.existeError = true;
        resHttp.mensaje = "No se encontro la materia prima";
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

//DELETE TABLA MATERIA PRIMA
router.delete('/inventario_materia/eliminar/:cod_materia',validarToken,async(req,res)=>{
    const {cod_materia}=req.params;

    const dbHelper = new Dbhelper();
    const resHttp = new RespuestaHttp();
    try {

        const respuesta = await dbHelper.query('CALL mi_del_materia_prima (?);', [cod_materia]);

        resHttp.respuesta = respuesta;
        resHttp.mensaje = "Materia prima eliminada correctamente";
        return res.status(200).send(resHttp);

    } catch ({ message }) {
        resHttp.existeError = true;
        resHttp.mensaje = message;
        return res.status(400).send(resHttp);
    }
});

//INSERT TABLA MATERIA PRIMA
router.post('/inventario_materia/insertar',validarToken,async(req,res)=>{
    const{cod_materia,nom_materia,descripcion,pre_Compra_materia,tip_medida} =req.body;

    const dbHelper = new Dbhelper();
    const httpRes = new RespuestaHttp();
    try {

        const venta = await dbHelper.query('CALL mi_ins_materia_prima (?,?,?,?,?);',
         [cod_materia,nom_materia,descripcion,pre_Compra_materia,tip_medida]);

        httpRes.respuesta = venta;
        httpRes.mensaje = "Materia prima creada";
        return res.status(200).send(httpRes);

    } catch ({ message }) {
        httpRes.existeError = true;
        httpRes.mensaje = message;
        return res.status(400).send(httpRes);
    }
});

//UPDATE TABLA MATERIA PRIMA
router.put('/inventario_materia/actualizar',validarToken,async (req, res) => {
    const{cod_materia,nom_materia,descripcion,pre_Compra_materia,tip_medida} = req.body;
   
    const dbHelper = new Dbhelper();
    const httpRes = new RespuestaHttp();

    try {

        const venta_actualizar = await dbHelper.query("CALL mi_upd_materia_prima (?,?,?,?,?);", 
        [cod_materia,nom_materia,descripcion,pre_Compra_materia,tip_medida]);

        httpRes.respuesta = venta_actualizar;
        httpRes.mensaje = "Materia prima actualizada";
        return res.status(200).send(httpRes);

    } catch ({ message }) {
        httpRes.existeError = true;
        httpRes.mensaje = message;
        return res.status(400).send(httpRes);
    }
});

//TABLA INVENTARIO MATERIA PRIMA
//SELECT DE TODOS LOS DATOS DE LA TABLA INVENTARIO MATERIA PRIMA
router.get('/inventario_materia_prima',validarToken,async (req, res) => {

    const dbHelper = new Dbhelper();
    const resHttp = new RespuestaHttp();
    try {

        const datos = await dbHelper.query('CALL mi_sel_todo_invent_materia_prima;');
        resHttp.respuesta = datos;
        return res.status(200).send(resHttp);

    } catch ({ message }) {
        resHttp.existeError = true;
        resHttp.mensaje = message;
        return res.status(400).send(resHttp);
    }
});

//SELECT DE LA TABLA INVENTARIO MATERIA PRIMA
router.get('/inventario_materia_prima/:cod_invent_materia_prima',validarToken,async (req, res) => {
    const { cod_invent_materia_prima } = req.params;

    const dbHelper = new Dbhelper();
    const resHttp = new RespuestaHttp();

    const datos = await dbHelper.query('CALL mi_sel_invent_materia_prima (?);', [cod_invent_materia_prima]);
    try {
    if (datos.length === 0) {
        resHttp.existeError = true;
        resHttp.mensaje = "No se encontro el invenario de materia prima";
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

//DELETE TABLA INVENTARIO MATERIA PRIMA
router.delete('/inventario_materia_prima/eliminar/:cod_invent_materia_prima',validarToken,async(req,res)=>{
    const {cod_invent_materia_prima}=req.params;

    const dbHelper = new Dbhelper();
    const resHttp = new RespuestaHttp();
    try {

        const respuesta = await dbHelper.query('CALL mi_del_invent_materia_prima (?);', [cod_invent_materia_prima]);

        resHttp.respuesta = respuesta;
        resHttp.mensaje = "Inventario en materia prima eliminado correctamente";
        return res.status(200).send(resHttp);

    } catch ({ message }) {
        resHttp.existeError = true;
        resHttp.mensaje = message;
        return res.status(400).send(resHttp);
    }
});

//INSERT TABLA INVENTARIO MATERIA PRIMA
router.post('/inventario_materia_prima/insertar',validarToken,async(req,res)=>{
    const{cod_invent_materia_prima,cod_materia,fec_compra,can_Compra,pre_compra,fec_caducidad} =req.body;

    const dbHelper = new Dbhelper();
    const httpRes = new RespuestaHttp();
    try {

        const venta = await dbHelper.query('CALL mi_ins_invent_materia_prima (?,?,?,?,?,?);', 
        [cod_invent_materia_prima,cod_materia,fec_compra,can_Compra,pre_compra,fec_caducidad]);

        httpRes.respuesta = venta;
        httpRes.mensaje = "Inventario de materia prima creado";
        return res.status(200).send(httpRes);

    } catch ({ message }) {
        httpRes.existeError = true;
        httpRes.mensaje = message;
        return res.status(400).send(httpRes);
    }
});

//UPDATE TABLA INVENTARIO MATERIA PRIMA
router.put('/inventario_materia_prima/actualizar',validarToken,async (req, res) => {
    const{cod_invent_materia_prima,cod_materia,fec_compra,can_Compra,pre_compra,fec_caducidad} = req.body;
   
    const dbHelper = new Dbhelper();
    const httpRes = new RespuestaHttp();

    try {

        const venta_actualizar = await dbHelper.query("CALL mi_upd_invent_materia_prima (?,?,?,?,?,?);", 
        [cod_invent_materia_prima,cod_materia,fec_compra,can_Compra,pre_compra,fec_caducidad]);

        httpRes.respuesta = venta_actualizar;
        httpRes.mensaje = "Inventario de materia prima actualizado";
        return res.status(200).send(httpRes);

    } catch ({ message }) {
        httpRes.existeError = true;
        httpRes.mensaje = message;
        return res.status(400).send(httpRes);
    }
});

//TABLA PRODUCTOS MATERIA PRIMA
//SELECT DE TODOS LOS DATOS DE LA TABLA PRODUCTOS MATERIA PRIMA
router.get('/inventario_productos_materia_prima',validarToken,async (req, res) => {

    const dbHelper = new Dbhelper();
    const resHttp = new RespuestaHttp();
    try {

        const datos = await dbHelper.query('CALL mi_sel_todo_product_materia_prima;');
        resHttp.respuesta = datos;
        return res.status(200).send(resHttp);

    } catch ({ message }) {
        resHttp.existeError = true;
        resHttp.mensaje = message;
        return res.status(400).send(resHttp);
    }
});

//SELECT DE LA TABLA PRODUCTOS MATERIA PRIMA
router.get('/inventario_productos_materia_prima/:cod_prod_mat_prima',validarToken,async (req, res) => {
    const { cod_prod_mat_prima } = req.params;

    const dbHelper = new Dbhelper();
    const resHttp = new RespuestaHttp();

    const datos = await dbHelper.query('CALL mi_sel_product_materia_prima (?);', [cod_prod_mat_prima]);
    try {
    if (datos.length === 0) {
        resHttp.existeError = true;
        resHttp.mensaje = "No se encontro el producto de materia prima";
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

//DELETE TABLA PRODUCTOS MATERIA PRIMA
router.delete('/inventario_productos_materia_prima/eliminar/:cod_prod_mat_prima',validarToken,async(req,res)=>{
    const {cod_prod_mat_prima}=req.params;

    const dbHelper = new Dbhelper();
    const resHttp = new RespuestaHttp();
    try {

        const respuesta = await dbHelper.query('CALL mi_del_product_materia_prima (?);', [cod_prod_mat_prima]);

        resHttp.respuesta = respuesta;
        resHttp.mensaje = "Producto en materia prima eliminado correctamente";
        return res.status(200).send(resHttp);

    } catch ({ message }) {
        resHttp.existeError = true;
        resHttp.mensaje = message;
        return res.status(400).send(resHttp);
    }
});

//INSERT TABLA PRODUCTOS MATERIA PRIMA
router.post('/inventario_productos_materia_prima/insertar',validarToken,async(req,res)=>{
    const{cod_prod_mat_prima,cod_producto,cod_materia,can_materia_requerida} =req.body;

    const dbHelper = new Dbhelper();
    const httpRes = new RespuestaHttp();
    try {

        const venta = await dbHelper.query('CALL mi_ins_prod_materia_prima (?,?,?,?);', 
        [cod_prod_mat_prima,cod_producto,cod_materia,can_materia_requerida]);

        httpRes.respuesta = venta;
        httpRes.mensaje = "Producto en materia prima creado";
        return res.status(200).send(httpRes);

    } catch ({ message }) {
        httpRes.existeError = true;
        httpRes.mensaje = message;
        return res.status(400).send(httpRes);
    }
});

//UPDATE TABLA PRODUCTOS MATERIA PRIMA
router.put('/inventario_productos_materia_prima/actualizar',validarToken,async (req, res) => {
    const{cod_prod_mat_prima,cod_producto,cod_materia,can_materia_requerida} = req.body;
   
    const dbHelper = new Dbhelper();
    const httpRes = new RespuestaHttp();

    try {

        const venta_actualizar = await dbHelper.query("CALL mi_upd_product_materia_prima (?,?,?,?);", 
        [cod_prod_mat_prima,cod_producto,cod_materia,can_materia_requerida]);

        httpRes.respuesta = venta_actualizar;
        httpRes.mensaje = "Producto en materia prima actualizada";
        return res.status(200).send(httpRes);

    } catch ({ message }) {
        httpRes.existeError = true;
        httpRes.mensaje = message;
        return res.status(400).send(httpRes);
    }
});

module.exports=router;