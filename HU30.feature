Feature: Bitácora de gastos
    Como transportista,
    deseo anotar gastos de peajes y comida,
    para conocer mi ganancia neta real tras el flete.

    Scenario 1: Deducción automática de costos operativos sobre el ingreso bruto
        Given que me encuentro en la sección de control de costos del viaje activo
        When registro diferentes montos asociados a conceptos de peajes y alimentación
        Then el sistema resta automáticamente estos egresos de los ingresos brutos del servicio
        And actualiza de forma inmediata el balance con el cálculo de la utilidad neta

        INPUT:
            Módulo de control de costos operativo y abierto
            Montos de egresos ingresados por concepto de peajes y alimentación

        OUTPUT:
            Cálculo automatizado de la sustracción de costos
            Actualización del balance de utilidad neta en pantalla

    Scenario 2: Despliegue del resumen financiero al concluir el servicio de flete
        Given un flete finalizado que cuenta con ingresos percibidos y egresos guardados
        When el transportista realiza la acción de cerrar formalmente el viaje en la aplicación
        Then la plataforma despliega una interfaz de resumen con los estados financieros consolidados
        And muestra de manera destacada la ganancia neta real obtenida tras el servicio

        INPUT:
            Viaje en estado finalizado con registros de ingresos y egresos previos
            Acción de cerrar formalmente el viaje en la interfaz

        OUTPUT:
            Interfaz de resumen financiero consolidada en pantalla
            Indicador destacado con la cifra final de ganancia neta real calculada
