/*************************************************************************************************
**************************************************************************************************
**************************************************************************************************
LOGIN JWT
**************************************************************************************************
**************************************************************************************************
**************************************************************************************************/
const express = require ('express');
const Dbhelper = require("../../herramientas/dbhelper");
const { generarToken } = require('../../herramientas/jwt');
const RespuestaHttp = require("../../herramientas/respuesta");
const  { compararContrasena, } = require('../../herramientas/bcrypt');
const app = express();
 
app.post("/api/login", async (req , res) => {
    const { body } = req;
    const { dni, contrasena } = body;

    const dbHelper = new Dbhelper();
    const resHttp = new RespuestaHttp();

    

        const usuario = await dbHelper.query('select * from usuario_registro where dni_usuario= ?;', 
        [dni]);
        // 'CALL me_sel_val_dni_todo2_api_usuario(?);'
        // 'select * from usuario_registro where dni_usuario= ?;'

        if (usuario.length === 0) {
            resHttp.existeError = true;
            resHttp.mensaje = 'DNI incorrecto';
            return res.status(400).send(resHttp);
        }

        const contrasenaCorrecta = await compararContrasena(contrasena, usuario[0].contrasena);

        if (!contrasenaCorrecta) {
            resHttp.existeError = true;
            resHttp.mensaje = 'contraseña incorrecta';
            return res.status(400).send(resHttp);
        }
        const payload = {
            cod_usuario: usuario[0].cod_usuario,
            dni_usuario: usuario[0].dni_usuario
        };

        const token = generarToken(payload);

        resHttp.respuesta = token;
        return res.status(200).send(resHttp);

});

module.exports=app;