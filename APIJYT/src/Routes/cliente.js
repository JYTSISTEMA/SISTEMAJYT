const express = require ('express');
const router = express.Router();
const Dbhelper = require ("../../herramientas/dbhelper");
const RespuestaHttp = require("../../herramientas/respuesta");
const { validarToken } = require('../../herramientas/token');

/*************************************************************************************************
**************************************************************************************************
**************************************************************************************************
MODULO CLIENTES
**************************************************************************************************
**************************************************************************************************
**************************************************************************************************/
//TABLA DEPARTAMENTO
//SELECT DE TODOS LOS DATOS DE LA TABLA DEPARTAMENTO
router.get('/cliente_departamento',validarToken,async (req, res) => {
    const query= `CALL mc_sel_todo_departamento;`

    const dbHelper = new Dbhelper();
    const resHttp = new RespuestaHttp();
    try {

        const datos = await dbHelper.query('CALL mc_sel_todo_departamento;');
        resHttp.respuesta = datos;
        return res.status(200).send(resHttp);

    } catch ({ message }) {
        resHttp.existeError = true;
        resHttp.mensaje = message;
        return res.status(400).send(resHttp);
    }
});

//SELECT DE LA TABLA DEPARTAMENTO
router.get('/cliente_departamento/:departamento_id',validarToken,async (req, res) => {
    const { departamento_id } = req.params;

    const dbHelper = new Dbhelper();
    const resHttp = new RespuestaHttp();

    const datos = await dbHelper.query('CALL mc_sel_departamento (?);', [departamento_id]);
    try {
    if (datos.length === 0) {
        resHttp.existeError = true;
        resHttp.mensaje = "No se encontro el departamento";
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

//TABLA MUNICIPIO
//SELECT DE TODOS LOS DATOS DE LA TABLA MUNICIPIO
router.get('/cliente_municipio',validarToken,async (req, res) => {

    const dbHelper = new Dbhelper();
    const resHttp = new RespuestaHttp();
    try {

        const datos = await dbHelper.query('CALL mc_sel_todo_municipio;');
        resHttp.respuesta = datos;
        return res.status(200).send(resHttp);

    } catch ({ message }) {
        resHttp.existeError = true;
        resHttp.mensaje = message;
        return res.status(400).send(resHttp);
    }
});

//SELECT DE LA TABLA MUNICIPIO
router.get('/cliente_municipio/:municipio_id',validarToken,async (req, res) => {
    const { municipio_id } = req.params;

    const dbHelper = new Dbhelper();
    const resHttp = new RespuestaHttp();

    const datos = await dbHelper.query('CALL mc_sel_municipio (?);', [municipio_id]);
    try {
    if (datos.length === 0) {
        resHttp.existeError = true;
        resHttp.mensaje = "No se encontro el municipio";
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

//TABLA DIRECCION CLIENTE
//SELECT DE TODOS LOS DATOS DE LA TABLA MUNICIPIO
router.get('/cliente_direccion_cliente', validarToken,async(req, res) => {

    const dbHelper = new Dbhelper();
    const resHttp = new RespuestaHttp();
    try {

        const datos = await dbHelper.query('CALL mc_sel_todo_direccion_cliente;');
        resHttp.respuesta = datos;
        return res.status(200).send(resHttp);

    } catch ({ message }) {
        resHttp.existeError = true;
        resHttp.mensaje = message;
        return res.status(400).send(resHttp);
    }
});

//SELECT DE LA TABLA DIRECCION CLIENTE
router.get('/cliente_direccion_cliente/:direccion_id',validarToken,async (req, res) => {
    const { direccion_id } = req.params;

    const dbHelper = new Dbhelper();
    const resHttp = new RespuestaHttp();

    const datos = await dbHelper.query('CALL mc_sel_direccion_cliente (?);', [direccion_id]);
    try {
    if (datos.length === 0) {
        resHttp.existeError = true;
        resHttp.mensaje = "No se encontro la Direccion del cliente";
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

//DELETE TABLA DIRECCION CLIENTE
router.delete('/cliente_direccion_cliente/eliminar/:direccion_id',validarToken,async(req,res)=>{
    const {direccion_id}=req.params;

    const dbHelper = new Dbhelper();
    const resHttp = new RespuestaHttp();
    try {

        const respuesta = await dbHelper.query('CALL mc_del_direccion_cliente (?);', [direccion_id]);

        resHttp.respuesta = respuesta;
        resHttp.mensaje = "Direccion eliminada correctamente";
        return res.status(200).send(resHttp);

    } catch ({ message }) {
        resHttp.existeError = true;
        resHttp.mensaje = message;
        return res.status(400).send(resHttp);
    }
});

//INSERT TABLA DIRECCION CLIENTE
router.post('/cliente_direccion_cliente/insertar',validarToken,async(req,res)=>{
    const{direccion_id,cliente_id,direccion,direccion_ciudad,municipio_id,departamento_id,direccion_telefono} =req.body;

    const dbHelper = new Dbhelper();
    const httpRes = new RespuestaHttp();
    try {

        const venta = await dbHelper.query('CALL mc_ins_direccion_cliente (?,?,?,?,?,?,?);', 
        [direccion_id,cliente_id,direccion,direccion_ciudad,municipio_id,departamento_id,direccion_telefono]);

        httpRes.respuesta = venta;
        httpRes.mensaje = "Direccion creada";
        return res.status(200).send(httpRes);

    } catch ({ message }) {
        httpRes.existeError = true;
        httpRes.mensaje = message;
        return res.status(400).send(httpRes);
    }
});

//UPDATE TABLA DIRECCION CLIENTE
router.put('/cliente_direccion_cliente/actualizar',validarToken,async (req, res) => {
    const{direccion_id,cliente_id,direccion,direccion_ciudad,municipio_id,departamento_id,direccion_telefono} = req.body;
   
    const dbHelper = new Dbhelper();
    const httpRes = new RespuestaHttp();

    try {

        const venta_actualizar = await dbHelper.query("CALL mc_upd_direccion_cliente (?,?,?,?,?,?,?);", 
        [direccion_id,cliente_id,direccion,direccion_ciudad,municipio_id,departamento_id,direccion_telefono]);

        httpRes.respuesta = venta_actualizar;
        httpRes.mensaje = "Direccion actualizada";
        return res.status(200).send(httpRes);

    } catch ({ message }) {
        httpRes.existeError = true;
        httpRes.mensaje = message;
        return res.status(400).send(httpRes);
    }
});

//TABLA CLIENTE
//SELECT DE TODOS LOS DATOS DE LA TABLA CLIENTE
router.get('/cliente', validarToken,async(req, res) => {

    const dbHelper = new Dbhelper();
    const resHttp = new RespuestaHttp();
    try {

        const datos = await dbHelper.query('CALL mc_sel_todo_cliente;');
        resHttp.respuesta = datos;
        return res.status(200).send(resHttp);

    } catch ({ message }) {
        resHttp.existeError = true;
        resHttp.mensaje = message;
        return res.status(400).send(resHttp);
    }
});

//SELECT DE LA TABLA CLIENTE
router.get('/cliente/:cliente_id',validarToken,async (req, res) => {
    const { cliente_id } = req.params;

    const dbHelper = new Dbhelper();
    const resHttp = new RespuestaHttp();

    const datos = await dbHelper.query('CALL mc_sel_cliente (?);', [cliente_id]);
    try {
    if (datos.length === 0) {
        resHttp.existeError = true;
        resHttp.mensaje = "No se encontro el cliente";
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

//DELETE TABLA CLIENTE
router.delete('/cliente/eliminar/:cliente_id',validarToken,async(req,res)=>{
    const {cliente_id}=req.params;

    const dbHelper = new Dbhelper();
    const resHttp = new RespuestaHttp();
    try {

        const respuesta = await dbHelper.query('CALL mc_del_cliente (?);', [cliente_id]);

        resHttp.respuesta = respuesta;
        resHttp.mensaje = "Cliente eliminado correctamente";
        return res.status(200).send(resHttp);

    } catch ({ message }) {
        resHttp.existeError = true;
        resHttp.mensaje = message;
        return res.status(400).send(resHttp);
    }
});

//INSERT TABLA CLIENTE
router.post('/cliente/insertar',validarToken,async(req,res)=>{
    const{cliente_id,clinte_correo,cliente_contrase??a,cliente_fecha,cliente_dni,cliente_nombre,cliente_apellido,cliente_telefono,cliente_ciudad,cliente_direccion,departamento_id,municipio_id,compa??ia_nombre,compania_rtn} =req.body;

    const dbHelper = new Dbhelper();
    const httpRes = new RespuestaHttp();
    try {

        const venta = await dbHelper.query('CALL mc_ins_cliente (?,?,?,?,?,?,?,?,?,?,?,?,?,?);', 
        [cliente_id,clinte_correo,cliente_contrase??a,cliente_fecha,cliente_dni,cliente_nombre,cliente_apellido,cliente_telefono,cliente_ciudad,cliente_direccion,departamento_id,municipio_id,compa??ia_nombre,compania_rtn]);

        httpRes.respuesta = venta;
        httpRes.mensaje = "Cliente Creado";
        return res.status(200).send(httpRes);

    } catch ({ message }) {
        httpRes.existeError = true;
        httpRes.mensaje = message;
        return res.status(400).send(httpRes);
    }
});

//UPDATE TABLA CLIENTE
router.put('/cliente/actualizar',validarToken,async (req, res) => {
    const{cliente_id,clinte_correo,cliente_contrase??a,cliente_fecha,cliente_dni,cliente_nombre,cliente_apellido,cliente_telefono,cliente_ciudad,cliente_direccion,departamento_id,municipio_id,compa??ia_nombre,compania_rtn} = req.body;
   
    const dbHelper = new Dbhelper();
    const httpRes = new RespuestaHttp();

    try {

        const venta_actualizar = await dbHelper.query("CALL mc_upd_cliente (?,?,?,?,?,?,?,?,?,?,?,?,?,?);", 
        [cliente_id,clinte_correo,cliente_contrase??a,cliente_fecha,cliente_dni,cliente_nombre,cliente_apellido,cliente_telefono,cliente_ciudad,cliente_direccion,departamento_id,municipio_id,compa??ia_nombre,compania_rtn]);

        httpRes.respuesta = venta_actualizar;
        httpRes.mensaje = "Cliente actualizado";
        return res.status(200).send(httpRes);

    } catch ({ message }) {
        httpRes.existeError = true;
        httpRes.mensaje = message;
        return res.status(400).send(httpRes);
    }
});

//TABLA COMPA??IA
//SELECT DE TODOS LOS DATOS DE LA TABLA COMPA??IA
router.get('/cliente_compania',validarToken,async (req, res) => {

    const dbHelper = new Dbhelper();
    const resHttp = new RespuestaHttp();
    try {

        const datos = await dbHelper.query('CALL mc_sel_todo_compa??ia;');
        resHttp.respuesta = datos;
        return res.status(200).send(resHttp);

    } catch ({ message }) {
        resHttp.existeError = true;
        resHttp.mensaje = message;
        return res.status(400).send(resHttp);
    }
});

//SELECT DE LA TABLA COMPA??IA
router.get('/cliente_compania/:compania_rtn',validarToken,async (req, res) => {
    const { compania_rtn } = req.params;

    const dbHelper = new Dbhelper();
    const resHttp = new RespuestaHttp();

    const datos = await dbHelper.query('CALL mc_sel_compa??ia (?);', [compania_rtn]);
    try {
    if (datos.length === 0) {
        resHttp.existeError = true;
        resHttp.mensaje = "No se encontro la compa??ia";
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

//DELETE TABLA COMPA??IA
router.delete('/cliente_compania/eliminar/:compania_rtn',validarToken,async(req,res)=>{
    const {compania_rtn}=req.params;

    const dbHelper = new Dbhelper();
    const resHttp = new RespuestaHttp();
    try {

        const respuesta = await dbHelper.query('CALL mc_del_compa??ia (?);', [compania_rtn]);

        resHttp.respuesta = respuesta;
        resHttp.mensaje = "Compa??ia eliminada correctamente";
        return res.status(200).send(resHttp);

    } catch ({ message }) {
        resHttp.existeError = true;
        resHttp.mensaje = message;
        return res.status(400).send(resHttp);
    }
});

//INSERT TABLA COMPA??IA
router.post('/cliente_compania/insertar',validarToken,async(req,res)=>{
    const{compania_rtn,compa??ia_cai,compa??ia_legal_nom,compa??ia_comercial_nom,compa??ia_paginaweb,compa??ia_correo,compa??ia_facebook,compa??ia_instagram} =req.body;

    const dbHelper = new Dbhelper();
    const httpRes = new RespuestaHttp();
    try {

        const venta = await dbHelper.query('CALL mc_ins_compa??ia (?,?,?,?,?,?,?,?);', 
        [compania_rtn,compa??ia_cai,compa??ia_legal_nom,compa??ia_comercial_nom,compa??ia_paginaweb,compa??ia_correo,compa??ia_facebook,compa??ia_instagram]);

        httpRes.respuesta = venta;
        httpRes.mensaje = "Compa??ia creada";
        return res.status(200).send(httpRes);

    } catch ({ message }) {
        httpRes.existeError = true;
        httpRes.mensaje = message;
        return res.status(400).send(httpRes);
    }
});

//UPDATE TABLA COMPA??IA
router.put('/cliente_compania/actualizar',validarToken,async (req, res) => {
    const{compania_rtn,compa??ia_cai,compa??ia_legal_nom,compa??ia_comercial_nom,compa??ia_paginaweb,compa??ia_correo,compa??ia_facebook,compa??ia_instagram} = req.body;
   
    const dbHelper = new Dbhelper();
    const httpRes = new RespuestaHttp();

    try {

        const venta_actualizar = await dbHelper.query("CALL mc_upd_compa??ia (?,?,?,?,?,?,?,?);",
         [compania_rtn,compa??ia_cai,compa??ia_legal_nom,compa??ia_comercial_nom,compa??ia_paginaweb,compa??ia_correo,compa??ia_facebook,compa??ia_instagram]);

        httpRes.respuesta = venta_actualizar;
        httpRes.mensaje = "Compa??ia actualizada";
        return res.status(200).send(httpRes);

    } catch ({ message }) {
        httpRes.existeError = true;
        httpRes.mensaje = message;
        return res.status(400).send(httpRes);
    }
});

//TABLA COMPA??IA OFICINA
//SELECT DE TODOS LOS DATOS DE LA TABLA COMPA??IA OFICINA
router.get('/cliente_compania_oficina',validarToken,async (req, res) => {

    const dbHelper = new Dbhelper();
    const resHttp = new RespuestaHttp();
    try {

        const datos = await dbHelper.query('CALL mc_sel_todo_compa??ia_oficina;');
        resHttp.respuesta = datos;
        return res.status(200).send(resHttp);

    } catch ({ message }) {
        resHttp.existeError = true;
        resHttp.mensaje = message;
        return res.status(400).send(resHttp);
    }
});

//SELECT DE LA TABLA COMPA??IA OFICINA
router.get('/cliente_compania_oficina/:oficina_id',validarToken,async (req, res) => {
    const { oficina_id } = req.params;

    const dbHelper = new Dbhelper();
    const resHttp = new RespuestaHttp();

    const datos = await dbHelper.query('CALL mc_sel_compa??ia_oficina (?);', [oficina_id]);
    try {
    if (datos.length === 0) {
        resHttp.existeError = true;
        resHttp.mensaje = "No se encontro la oficina";
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

//DELETE TABLA COMPA??IA OFICINA
router.delete('/cliente_compania_oficina/eliminar/:oficina_id',validarToken,async(req,res)=>{
    const {oficina_id}=req.params;

    const dbHelper = new Dbhelper();
    const resHttp = new RespuestaHttp();
    try {

        const respuesta = await dbHelper.query('CALL mc_del_compa??ia_oficina (?);', [oficina_id]);

        resHttp.respuesta = respuesta;
        resHttp.mensaje = "Oficina eliminada correctamente";
        return res.status(200).send(resHttp);

    } catch ({ message }) {
        resHttp.existeError = true;
        resHttp.mensaje = message;
        return res.status(400).send(resHttp);
    }
});

//INSERT TABLA COMPA??IA OFICINA
router.post('/cliente_compania_oficina/insertar',validarToken,async(req,res)=>{
    const{oficina_id,compania_rtn,oficina_nombre,oficina_direccion,municipio_id,departamento_id,oficina_telefono_1,oficina_telefono_2} =req.body;

    const dbHelper = new Dbhelper();
    const httpRes = new RespuestaHttp();
    try {

        const venta = await dbHelper.query('CALL mc_ins_compa??ia_oficina (?,?,?,?,?,?,?,?);', 
        [oficina_id,compania_rtn,oficina_nombre,oficina_direccion,municipio_id,departamento_id,oficina_telefono_1,oficina_telefono_2]);

        httpRes.respuesta = venta;
        httpRes.mensaje = "Oficina creada";
        return res.status(200).send(httpRes);

    } catch ({ message }) {
        httpRes.existeError = true;
        httpRes.mensaje = message;
        return res.status(400).send(httpRes);
    }
});

//UPDATE TABLA COMPA??IA OFICINA
router.put('/cliente_compania_oficina/actualizar',validarToken,async (req, res) => {
    const{oficina_id,compania_rtn,oficina_nombre,oficina_direccion,municipio_id,departamento_id,oficina_telefono_1,oficina_telefono_2} = req.body;
   
    const dbHelper = new Dbhelper();
    const httpRes = new RespuestaHttp();

    try {

        const venta_actualizar = await dbHelper.query("CALL mc_upd_compa??ia_oficina (?,?,?,?,?,?,?,?);", 
        [oficina_id,compania_rtn,oficina_nombre,oficina_direccion,municipio_id,departamento_id,oficina_telefono_1,oficina_telefono_2]);

        httpRes.respuesta = venta_actualizar;
        httpRes.mensaje = "Oficina actualizada";
        return res.status(200).send(httpRes);

    } catch ({ message }) {
        httpRes.existeError = true;
        httpRes.mensaje = message;
        return res.status(400).send(httpRes);
    }
});

module.exports=router;