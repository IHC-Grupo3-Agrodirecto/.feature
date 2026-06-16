Feature: Generar recibo PDF
    Como productor
    deseo descargar un comprobante de mi pago de flete
    para mis registros contables personales

    Scenario 1: Descarga exitosa del comprobante en formato digital
        Given un pago de flete liquidado correctamente en la plataforma
        When pulso el botón para descargar el recibo correspondiente
        Then obtengo un archivo en formato PDF con el desglose detallado del costo compartido
        And visualizo de manera clara el ahorro obtenido en la transacción

        INPUT:
            Estado de liquidación del pago
            Acción de presionar el botón "Descargar recibo"

        OUTPUT:
            Archivo digital en formato PDF generado
            Estructura del costo compartido desglosada
            Monto del ahorro reflejado en el documento

    Scenario 2: Validación del contenido del comprobante descargado
        Given un productor que participó en un viaje consolidado dentro del sistema
        When abre el archivo PDF que fue descargado previamente
        Then puede verificar los datos informativos como la fecha de viaje y los productos transportados
        And visualiza las métricas de peso, el costo final pagado y el ahorro frente al flete individual

        INPUT:
            Historial de participación en viaje consolidado
            Visualización del archivo PDF abierto

        OUTPUT:
            Metadatos del viaje (fecha y productos) visibles
            Registro del peso de la carga en el documento
            Montos de costo pagado y ahorro relativo confirmados
