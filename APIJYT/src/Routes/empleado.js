const express = require ('express');
const router = express.Router();
const Dbhelper = require ("../../herramientas/dbhelper");
const RespuestaHttp = require("../../herramientas/respuesta");
const { validarToken } = require('../../herramientas/token');
const  { encryptarContrasena, } = require('../../herramientas/bcrypt');

/*************************************************************************************************
**************************************************************************************************
**************************************************************************************************
MODULO EMPLEADOS
**************************************************************************************************
**************************************************************************************************
**************************************************************************************************/
//TABLA ROL DE USUARIO
//SELECT DE TODOS LOS DATOS DE LA TABLA ROL DE USUARIO
router.get('/empleados',validarToken,async (req, res) => {

    const dbHelper = new Dbhelper();
    const resHttp = new RespuestaHttp();
    try {

        const datos = await dbHelper.query('CALL me_sel_todo_rol_usuario;');
        resHttp.respuesta = datos;
        return res.status(200).send(resHttp);

    } catch ({ message }) {
        resHttp.existeError = true;
        resHttp.mensaje = message;
        return res.status(400).send(resHttp);
    }
});

//SELECT DE LA TABLA ROL DE USUAIRO
router.get('/empleados/:cod_rol',validarToken,async (req, res) => {
    const { cod_rol } = req.params;

    const dbHelper = new Dbhelper();
    const resHttp = new RespuestaHttp();

    const datos = await dbHelper.query('CALL me_sel_rol_usuario (?);', [cod_rol]);
    try {
    if (datos.length === 0) {
        resHttp.existeError = true;
        resHttp.mensaje = "No se encontro el rol";
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

//DELETE TABLA ROL DE USUAIRO
router.delete('/empleados/eliminar/:cod_rol',validarToken,async(req,res)=>{
    const {cod_rol}=req.params;

    const dbHelper = new Dbhelper();
    const resHttp = new RespuestaHttp();
    try {

        const respuesta = await dbHelper.query('CALL me_del_rol_usuario (?);', [cod_rol]);

        resHttp.respuesta = respuesta;
        resHttp.mensaje = "Rol eliminado correctamente";
        return res.status(200).send(resHttp);

    } catch ({ message }) {
        resHttp.existeError = true;
        resHttp.mensaje = message;
        return res.status(400).send(resHttp);
    }
});

//INSERT TABLA ROL DE USUAIRO
router.post('/empleados/insertar',validarToken,async(req,res)=>{
    const{cod_rol,tipo_rol} =req.body;

    const dbHelper = new Dbhelper();
    const httpRes = new RespuestaHttp();
    try {

        const venta = await dbHelper.query('CALL me_ins_rol_usuario (?,?);', 
        [cod_rol,tipo_rol]);

        httpRes.respuesta = venta;
        httpRes.mensaje = "Rol creado";
        return res.status(200).send(httpRes);

    } catch ({ message }) {
        httpRes.existeError = true;
        httpRes.mensaje = message;
        return res.status(400).send(httpRes);
    }
});

//UPDATE TABLA ROL DE USUAIRO
router.put('/empleados/actualizar',validarToken,async (req, res) => {
    const{cod_rol,tipo_rol} = req.body;
   
    const dbHelper = new Dbhelper();
    const httpRes = new RespuestaHttp();

    try {

        const venta_actualizar = await dbHelper.query("CALL me_upd_rol_usuario(?,?);",
         [cod_rol,tipo_rol]);

        httpRes.respuesta = venta_actualizar;
        httpRes.mensaje = "Rol actualizado";
        return res.status(200).send(httpRes);

    } catch ({ message }) {
        httpRes.existeError = true;
        httpRes.mensaje = message;
        return res.status(400).send(httpRes);
    }
});

//TABLA TIPO DE OPERACION
//SELECT DE TODOS LOS DATOS DE LA TABLA TIPO DE OPERACION
router.get('/empleados_tipo_operacion',validarToken,async (req, res) => {

    const dbHelper = new Dbhelper();
    const resHttp = new RespuestaHttp();
    try {

        const datos = await dbHelper.query('CALL me_sel_todo_tipo_operacion;');
        resHttp.respuesta = datos;
        return res.status(200).send(resHttp);

    } catch ({ message }) {
        resHttp.existeError = true;
        resHttp.mensaje = message;
        return res.status(400).send(resHttp);
    }
});

//SELECT DE LA TABLA TIPO DE OPERACION
router.get('/empleados_tipo_operacion/:cod_tipo_operacion',validarToken,async (req, res) => {
    const { cod_tipo_operacion } = req.params;

    const dbHelper = new Dbhelper();
    const resHttp = new RespuestaHttp();

    const datos = await dbHelper.query('CALL me_sel_tipo_operacion (?);', [cod_tipo_operacion]);
    try {
    if (datos.length === 0) {
        resHttp.existeError = true;
        resHttp.mensaje = "No se encontro la operacion";
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

//DELETE TABLA TIPO DE OPERACION
router.delete('/empleados_tipo_operacion/eliminar/:cod_tipo_operacion',validarToken,async(req,res)=>{
    const {cod_tipo_operacion}=req.params;

    const dbHelper = new Dbhelper();
    const resHttp = new RespuestaHttp();
    try {

        const respuesta = await dbHelper.query('CALL me_del_tipo_operacion (?);', [cod_tipo_operacion]);

        resHttp.respuesta = respuesta;
        resHttp.mensaje = "Operacion eliminada correctamente";
        return res.status(200).send(resHttp);

    } catch ({ message }) {
        resHttp.existeError = true;
        resHttp.mensaje = message;
        return res.status(400).send(resHttp);
    }
});

//INSERT TABLA TIPO DE OPERACION
router.post('/empleados_tipo_operacion/insertar',validarToken,async(req,res)=>{
    const{cod_tipo_operacion,nom_operacion} =req.body;

    const dbHelper = new Dbhelper();
    const httpRes = new RespuestaHttp();
    try {

        const venta = await dbHelper.query('CALL me_ins_tipo_operacion (?,?);', 
        [cod_tipo_operacion,nom_operacion]);

        httpRes.respuesta = venta;
        httpRes.mensaje = "Operacion creada";
        return res.status(200).send(httpRes);

    } catch ({ message }) {
        httpRes.existeError = true;
        httpRes.mensaje = message;
        return res.status(400).send(httpRes);
    }
});

//UPDATE TABLA TIPO DE OPERACION
router.put('/empleados_tipo_operacion/actualizar',validarToken,async (req, res) => {
    const{cod_tipo_operacion,nom_operacion} = req.body;
   
    const dbHelper = new Dbhelper();
    const httpRes = new RespuestaHttp();

    try {

        const venta_actualizar = await dbHelper.query("CALL me_upd_tipo_operacion(?,?);", 
        [cod_tipo_operacion,nom_operacion]);

        httpRes.respuesta = venta_actualizar;
        httpRes.mensaje = "Operacion actualizada";
        return res.status(200).send(httpRes);

    } catch ({ message }) {
        httpRes.existeError = true;
        httpRes.mensaje = message;
        return res.status(400).send(httpRes);
    }
});

//TABLA USUARIO REGISTRO
//SELECT DE TODOS LOS DATOS DE LA TABLA USUARIO REGISTRO
router.get('/empleados_usuario_registro',validarToken,async (req, res) => {
    const query= `CALL me_sel_todo_usuario;`

    const dbHelper = new Dbhelper();
    const resHttp = new RespuestaHttp();
    try {

        const datos = await dbHelper.query('CALL me_sel_todo_usuario;');
        resHttp.respuesta = datos;
        return res.status(200).send(resHttp);

    } catch ({ message }) {
        resHttp.existeError = true;
        resHttp.mensaje = message;
        return res.status(400).send(resHttp);
    }
});


//SELECT DE LA TABLA USUARIO REGISTRO
router.get('/empleados_usuario_registro/:cod_usuario',validarToken,async (req, res) => {
    const { cod_usuario } = req.params;

    const dbHelper = new Dbhelper();
    const resHttp = new RespuestaHttp();

    const datos = await dbHelper.query('CALL me_sel_usuario (?);', [cod_usuario]);
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

//DELETE TABLA USUARIO REGISTRO
router.delete('/empleados_usuario_registro/eliminar/:cod_usuario',validarToken,async(req,res)=>{
    const {cod_usuario}=req.params;

    const dbHelper = new Dbhelper();
    const resHttp = new RespuestaHttp();
    try {

        const respuesta = await dbHelper.query('CALL me_del_registro_usuario (?);', [cod_usuario]);

        resHttp.respuesta = respuesta;
        resHttp.mensaje = "Usuario eliminado correctamente";
        return res.status(200).send(resHttp);

    } catch ({ message }) {
        resHttp.existeError = true;
        resHttp.mensaje = message;
        return res.status(400).send(resHttp);
    }
});

//INSERT TABLA USUARIO REGISTRO
router.post('/empleados_usuario_registro/insertar',async(req,res)=>{
    const{cod_usuario,dni_usuario,cod_rol,contrasena,fecha,nombre,apellido,num_telefono,correo_electronico,departamento,municipio,direccion} =req.body;

    const dbHelper = new Dbhelper();
    const httpRes = new RespuestaHttp();
    try {

        const constrasenaencryptada= await encryptarContrasena (contrasena);

        const venta = await dbHelper.query('CALL me_ins_usuario_registro (?,?,?,?,?,?,?,?,?,?,?,?);', 
        [cod_usuario,dni_usuario,cod_rol,constrasenaencryptada,fecha,nombre,apellido,num_telefono,correo_electronico,departamento,municipio,direccion]);

        httpRes.respuesta = venta;
        httpRes.mensaje = "Usuario creado";
        return res.status(200).send(httpRes);

    } catch ({ message }) {
        httpRes.existeError = true;
        httpRes.mensaje = message;
        return res.status(400).send(httpRes);
    }
});

//UPDATE TABLA USUARIO REGISTRO
router.put('/empleados_usuario_registro/actualizar',validarToken,async (req, res) => {
    const{cod_usuario,dni_usuario,cod_rol,contrasena,fecha,nombre,apellido,num_telefono,correo_electronico,departamento,municipio,direccion} = req.body;
   
    const dbHelper = new Dbhelper();
    const httpRes = new RespuestaHttp();

    try {

        const constrasenaencryptada= await encryptarContrasena (contrasena);

        const venta_actualizar = await dbHelper.query("CALL me_upd_registro_usuario (?,?,?,?,?,?,?,?,?,?,?,?);", 
        [cod_usuario,dni_usuario,cod_rol,constrasenaencryptada,fecha,nombre,apellido,num_telefono,correo_electronico,departamento,municipio,direccion]);

        httpRes.respuesta = venta_actualizar;
        httpRes.mensaje = "Usuario actualizado";
        return res.status(200).send(httpRes);

    } catch ({ message }) {
        httpRes.existeError = true;
        httpRes.mensaje = message;
        return res.status(400).send(httpRes);
    }
});

//TABLA REGISTRO OPERACION
//SELECT DE TODOS LOS DATOS DE LA TABLA USUARIO REGISTRO
router.get('/empleados_registro_operacion',validarToken,async (req, res) => {

    const dbHelper = new Dbhelper();
    const resHttp = new RespuestaHttp();
    try {

        const datos = await dbHelper.query('CALL me_sel_todo_registro_operacion;');
        resHttp.respuesta = datos;
        return res.status(200).send(resHttp);

    } catch ({ message }) {
        resHttp.existeError = true;
        resHttp.mensaje = message;
        return res.status(400).send(resHttp);
    }
});

//SELECT DE LA TABLA REGISTRO OPERACION
router.get('/empleados_registro_operacion/:cod_operacion',validarToken,async (req, res) => {
    const { cod_operacion } = req.params;

    const dbHelper = new Dbhelper();
    const resHttp = new RespuestaHttp();

    const datos = await dbHelper.query('CALL me_sel_registro_operacion (?);', [cod_operacion]);
    try {
    if (datos.length === 0) {
        resHttp.existeError = true;
        resHttp.mensaje = "No se encontro el registro de la operacion";
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

//DELETE TABLA REGISTRO OPERACION
router.delete('/empleados_registro_operacion/eliminar/:cod_operacion',validarToken,async(req,res)=>{
    const {cod_operacion}=req.params;

    const dbHelper = new Dbhelper();
    const resHttp = new RespuestaHttp();
    try {

        const respuesta = await dbHelper.query('CALL me_del_registro_operacion (?);', [cod_operacion]);

        resHttp.respuesta = respuesta;
        resHttp.mensaje = "Reigstro de operaicon eliminado correctamente";
        return res.status(200).send(resHttp);

    } catch ({ message }) {
        resHttp.existeError = true;
        resHttp.mensaje = message;
        return res.status(400).send(resHttp);
    }
});

//INSERT TABLA REGISTRO OPERACION
router.post('/empleados_registro_operacion/insertar',validarToken,async(req,res)=>{
    const{cod_operacion,cod_usuario,fecha_operacion,cod_tipo_operacion,referencia_operacion} =req.body;

    const dbHelper = new Dbhelper();
    const httpRes = new RespuestaHttp();
    try {

        const venta = await dbHelper.query('CALL me_ins_registro_operacion (?,?,?,?,?);', 
        [cod_operacion,cod_usuario,fecha_operacion,cod_tipo_operacion,referencia_operacion]);

        httpRes.respuesta = venta;
        httpRes.mensaje = "Registro de operacion creado";
        return res.status(200).send(httpRes);

    } catch ({ message }) {
        httpRes.existeError = true;
        httpRes.mensaje = message;
        return res.status(400).send(httpRes);
    }
});

//UPDATE TABLA REGISTRO OPERACION
router.put('/empleados_registro_operacion/actualizar',validarToken,async (req, res) => {
    const{cod_operacion,cod_usuario,fecha_operacion,cod_tipo_operacion,referencia_operacion} = req.body;
   
    const dbHelper = new Dbhelper();
    const httpRes = new RespuestaHttp();

    try {

        const venta_actualizar = await dbHelper.query("CALL me_upd_registro_operacion (?,?,?,?,?);",
         [cod_operacion,cod_usuario,fecha_operacion,cod_tipo_operacion,referencia_operacion]);

        httpRes.respuesta = venta_actualizar;
        httpRes.mensaje = "Reigstro de operacion actualizada";
        return res.status(200).send(httpRes);

    } catch ({ message }) {
        httpRes.existeError = true;
        httpRes.mensaje = message;
        return res.status(400).send(httpRes);
    }
});

//TABLA PAGO SALARIO
//SELECT DE TODOS LOS DATOS DE LA TABLA PAGO SALARIO
router.get('/empleados_pago_salario',validarToken,async (req, res) => {

    const dbHelper = new Dbhelper();
    const resHttp = new RespuestaHttp();
    try {

        const datos = await dbHelper.query('CALL me_sel_todo_pago_salario;');
        resHttp.respuesta = datos;
        return res.status(200).send(resHttp);

    } catch ({ message }) {
        resHttp.existeError = true;
        resHttp.mensaje = message;
        return res.status(400).send(resHttp);
    }
});

//SELECT DE LA TABLA PAGO SALARIO
router.get('/empleados_pago_salario/:cod_pago',validarToken,async (req, res) => {
    const { cod_pago } = req.params;

    const dbHelper = new Dbhelper();
    const resHttp = new RespuestaHttp();

    const datos = await dbHelper.query('CALL me_sel_pago_salario (?);', [cod_pago]);
    try {
    if (datos.length === 0) {
        resHttp.existeError = true;
        resHttp.mensaje = "No se encontro el pago";
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

//DELETE TABLA PAGO SALARIO
router.delete('/empleados_pago_salario/eliminar/:cod_pago',validarToken,async(req,res)=>{
    const {cod_pago}=req.params;

    const dbHelper = new Dbhelper();
    const resHttp = new RespuestaHttp();
    try {

        const respuesta = await dbHelper.query('CALL me_del_pago_salario (?);', [cod_pago]);

        resHttp.respuesta = respuesta;
        resHttp.mensaje = "Pago salrio eliminado correctamente";
        return res.status(200).send(resHttp);

    } catch ({ message }) {
        resHttp.existeError = true;
        resHttp.mensaje = message;
        return res.status(400).send(resHttp);
    }
});

//INSERT TABLA PAGO SALARIO
router.post('/empleados_pago_salario/insertar',validarToken,async(req,res)=>{
    const{cod_pago,cod_usuario,sueldo_bruto,IHSS,RAP,otras_deducciones,vacaciones,descripcion_vacaciones,salario} =req.body;

    const dbHelper = new Dbhelper();
    const httpRes = new RespuestaHttp();
    try {

        const venta = await dbHelper.query('CALL me_ins_pago_salario (?,?,?,?,?,?,?,?,?);',
         [cod_pago,cod_usuario,sueldo_bruto,IHSS,RAP,otras_deducciones,vacaciones,descripcion_vacaciones,salario]);

        httpRes.respuesta = venta;
        httpRes.mensaje = "Pago salario creado";
        return res.status(200).send(httpRes);

    } catch ({ message }) {
        httpRes.existeError = true;
        httpRes.mensaje = message;
        return res.status(400).send(httpRes);
    }
});

//UPDATE TABLA PAGO SALARIO
router.put('/empleados_pago_salario/actualizar',validarToken,async (req, res) => {
    const{cod_pago,cod_usuario,sueldo_bruto,IHSS,RAP,otras_deducciones,vacaciones,descripcion_vacaciones,salario} = req.body;
   
    const dbHelper = new Dbhelper();
    const httpRes = new RespuestaHttp();

    try {

        const venta_actualizar = await dbHelper.query("CALL me_upd_pago_salario (?,?,?,?,?,?,?,?,?);", 
        [cod_pago,cod_usuario,sueldo_bruto,IHSS,RAP,otras_deducciones,vacaciones,descripcion_vacaciones,salario]);

        httpRes.respuesta = venta_actualizar;
        httpRes.mensaje = "Pago salario actualizado";
        return res.status(200).send(httpRes);

    } catch ({ message }) {
        httpRes.existeError = true;
        httpRes.mensaje = message;
        return res.status(400).send(httpRes);
    }
});

module.exports=router;