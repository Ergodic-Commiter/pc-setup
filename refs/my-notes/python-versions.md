# Ambientes de Python  

Los ambientes de Python son claves en el desarrollo de paquetes.  
En diferentes foros se recomiendan varias herramientas.  Por ejemplo Anaconda 
para paquetes de análisis de datos, u otras estándar como `virtualenv` o `venv`.  

Después de utilizar por mucho tiempo Anaconda, en el presente me inclino por manejar 
los ambientes a través de `pyenv`.  La razón práctica de este cambio es que Anaconda 
es muy tardada al instalar paquetes, y esto se puede deber a las restricciones de 
seguridad godines.  Otra razón más personal es que al no tener un equipo que use
Anaconda, entonces se pierden las ventajas comparativas de otras herramientas como `pyenv`.  

Habiéndola ya instalado se realizan los siguientes pasos:  

```shell
$ pyenv install 3.12.2
$ pyenv virtualenv 3.12.2 proj312
$ pyenv local proj312
$ pip install ... 
```

