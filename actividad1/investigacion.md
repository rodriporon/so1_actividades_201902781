# Tipos de Kernel y sus Diferencias

## Tipos de Kernel

Existen diferentes ***tipos de kernel*** para diferentes sistemas operativos y dispositivos finales. Conforme a sus características, pueden dividirse en tres grupos:

* **Kernel monolítico**: Un kernel grande para todas las tareas. Es el único responsable de la gestión de la memoria y de los procesos, de la comunicación entre procesos y proporciona funciones de soporte de drivers y hardware. Los sistemas operativos que usan el kernel monolítico son Linux, OS X y Windows.

* **Microkernel**: El microkernel se ha diseñado intencionadamente de un tamaño pequeño para que en caso de fallo no paralice todo el sistema operativo. No obstante, para que pueda asumir las mismas funciones que un kernel grande, está dividido en varios módulos. Como ejemplo de aplicación solo existe el componente Mach de OS X, ya que hasta ahora no hay ningún sistema operativo con microkernel.

* **Kernel híbrido**: La combinación del kernel monolítico y el microkernel se denomina kernel híbrido. En este caso, el kernel grande se hace más compacto y modulable. Otras partes del kernel pueden cargarse dinámicamente. Esto ya ocurre en cierta medida en Linux y OS X.

## Diferencias entre los tipos de Kernel

| Kernel Monolítico | Microkernel | Kernel Híbrido |
| :--- | :--- | :--- |
| Es el kernel más grande para todas las tareas | Intencionalmente se diseñó de un tamaño pequeño | Su tamaño es modulable de acuerdo a la necesidad de la tarea|
| Se encarga de toda la gestión de memoria y procesos | Por su pequeño tamaño la gestión de sus procesos y memoria se divide en modulos | La gestión de los procesos se hace dinámicamente |

# User vs Kernel Mode

## User Mode

Al iniciar una aplicación en modo de usuario, Windows crea un proceso para la aplicación. El proceso proporciona a la aplicación un espacio de direcciones virtuales privado y una tabla de identificadores privados. Dado que el espacio de direcciones virtuales de una aplicación es privado, una aplicación no puede modificar los datos que pertenecen a otra aplicación. Cada aplicación se ejecuta de forma aislada y, si una aplicación se bloquea, el bloqueo se limita a esa aplicación. Otras aplicaciones y el sistema operativo no se ven afectados por el bloqueo.

Además de ser privado, el espacio de direcciones virtuales de una aplicación en modo de usuario es limitado. Un proceso que se ejecuta en modo de usuario no puede acceder a direcciones virtuales reservadas para el sistema operativo. Limitar el espacio de direcciones virtuales de una aplicación en modo de usuario impide que la aplicación modifique los datos críticos del sistema operativo, y posiblemente perjudiciales.

## Kernel Mode

Todo el código que se ejecuta en modo kernel comparte un único espacio de direcciones virtuales. Por lo tanto, un controlador en modo kernel no está aislado de otros controladores y del propio sistema operativo. Si un controlador en modo kernel escribe accidentalmente en la dirección virtual incorrecta, los datos que pertenecen al sistema operativo u otro controlador podrían verse comprometidos. Si se bloquea un controlador en modo kernel, todo el sistema operativo se bloquea.

En este diagrama se muestra la comunicación entre los componentes de modo usuario y modo kernel.

![En este diagrama se muestra la comunicación entre los componentes de modo usuario y modo kernel.](https://learn.microsoft.com/es-es/windows-hardware/drivers/gettingstarted/images/userandkernelmode01.png)



