Feature: IA Consejera de ventas
    Como productor
    deseo que una IA analice las tendencias
    para recibir consejos sobre cuándo consolidar mi carga

    Scenario 1: Análisis de tendencias para productos de almacenamiento prolongado
        Given datos históricos de precios cargados para un producto de larga duración
        When consulto a la inteligencia artificial sobre el comportamiento del mercado
        Then recibo una sugerencia de espera estratégica basada en una proyección de alza de precios
        And el sistema justifica la recomendación según la tendencia histórica analizada

        INPUT:
            Historial de precios de productos no perecederos
            Acción de consultar a la IA consejera

        OUTPUT:
            Recomendación de tiempo de espera óptimo
            Análisis de proyección de precios en pantalla

    Scenario 2: Análisis de tendencias para productos de vencimiento rápido
        Given datos históricos de precios cargados para un producto perecible
        When consulto a la inteligencia artificial sobre el comportamiento del mercado
        Then recibo una sugerencia inmediata de consolidación para aprovechar las condiciones actuales
        And el sistema advierte sobre el riesgo de pérdidas por vencimiento del producto

        INPUT:
            Historial de precios de productos perecederos
            Acción de consultar a la IA consejera

        OUTPUT:
            Sugerencia de consolidación inmediata
            Mensaje de alerta por caducidad o merma de producto
