Feature: Precios EMMSA
    Como productor
    deseo consultar los precios del día en el Mercado Mayorista
    para saber si la consolidación me es rentable hoy

    Scenario 1: Consulta exitosa de la tabla oficial de precios por producto
        Given que me encuentro en el módulo de precios informativos de la aplicación
        When ingreso el nombre de un producto agrícola específico para la búsqueda
        Then veo la tabla oficial de precios por kilogramo correspondiente al Mercado Mayorista

        INPUT:
            Módulo de precios activo
            Nombre del producto agrícola ingresado

        OUTPUT:
            Tabla de precios oficiales actualizada por kilogramo

    Scenario 2: Visualización de la tendencia comparativa de precios
        Given la tabla de precios del producto abierta en la pantalla
        When selecciono la opción para ver la tendencia del mercado
        Then el sistema muestra un indicador comparativo entre el valor comercial actual y el promedio histórico reciente

        INPUT:
            Tabla de precios en pantalla
            Acción de presionar el botón "Ver tendencia"

        OUTPUT:
            Módulo gráfico o visual de tendencia desplegado
            Comparativa de precio actual frente al promedio histórico
