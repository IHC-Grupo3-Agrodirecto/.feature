Feature: Reporte de ahorro anual
    Como productor
    quiero ver cuánto dinero ahorré en fletes compartidos al año
    para justificar mi fidelidad a la plataforma

    Scenario 1: Visualización del ahorro total acumulado
        Given mi perfil de productor con viajes consolidados registrados durante el periodo
        When entro a la sección de mis logros personales
        Then el sistema muestra el monto total de dinero ahorrado en fletes compartidos
        And resalta la comparación frente al costo del transporte individual

        INPUT:
            Historial de viajes consolidados del productor
            Sección "Mis Logros" seleccionada
            Tarifas de transporte individual de referencia

        OUTPUT:
            Monto total de dinero ahorrado en el año
            Gráfico o indicador comparativo frente a transporte individual

    Scenario 2: Consulta de desglose de ahorros mensuales
        Given el reporte de ahorro anual visible en la pantalla
        When selecciono un mes específico del calendario
        Then el sistema detalla la cantidad de viajes realizados en ese periodo
        And muestra el monto de dinero ahorrado en comparación con el flete individual

        INPUT:
            Reporte anual abierto
            Mes específico seleccionado

        OUTPUT:
            Cantidad exacta de viajes consolidados en el mes
            Monto de ahorro mensual calculado
