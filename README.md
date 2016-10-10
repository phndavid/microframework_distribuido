# microframework_distribuido

Aprovicionamiento de servidor web usando Node Js y servidor de bases de datos usando Postgress. <br>

Este repositorio permite aprovisionar automáticamente 2 máquinas virtuales que incluyen un servidor de base de datos y web. <br>
<b>Nota:</b> realizar en un computador con sistema operativo Ubuntu 14.04.Previamente, se debe tener instalado Vagrant en la computadora que en la que se desea realizar el aprovisionamiento. <br>
1. Clonar repositorio 
2. Habilitar la sub.interfaz con el comando ifcofig eth4:0 192.168.131.179 
4. Ejecutar el comando vagrant up 
5. Una vez finalizado este procedimiento, puede ir al navegador y ejecutar las siguientes Ips: 
a) 192.168.131.174:3000 (Aplicacion web) 
para ingresar al REST de la base de datos digitar la URI /api/device

Responsable:
<ul><li><a href="https://co.linkedin.com/in/phndavid">Nelson David Padilla</a></li></ul>
