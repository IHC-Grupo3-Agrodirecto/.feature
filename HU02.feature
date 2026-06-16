Feature: Registro de transportista de carga
  Como transportista de carga
  Quiero registrar mi unidad, placa y RUC
  Para ofrecer servicios de flete compartido en la plataforma

  Scenario Outline: Registro de transportista con documentos válidos
    Given que el transportista accede a la sección de registro
    When completa el formulario con los siguientes datos:
      | Campo               | Valor                    |
      | <campo>             | <valor>                  |
    And sube los documentos requeridos:
      | Documento           | Archivo                  |
      | <documento>         | <archivo>                |
    And presiona el botón "Enviar solicitud"
    Then el perfil queda pendiente de validación
    And el sistema notifica: "Tu perfil será verificado en un plazo de 24 horas"
    And recibe un email de confirmación

    Examples:
      | campo                     | valor                    | documento              | archivo              |
      | Nombre completo           | Roberto Campos           | Licencia de conducir   | licencia_front.jpg   |
      | RUC                       | 20456789123              | Licencia de conducir   | licencia_back.jpg    |
      | Número de placa           | ABC-1234                 | SOAT vigente           | soat_2025.pdf        |
      | Marca y modelo de camión  | Volvo FH16               | Tarjeta de propiedad   | propiedad.jpg        |
      | Capacidad en toneladas    | 18                       | Revisión técnica       | revitech_2025.pdf    |

  Scenario: Rechazo de registro por documento inválido o vencido
    Given que el transportista sube una foto de su licencia de conducir
    When la imagen es borrosa o la licencia está vencida
    And el sistema realiza validación
    Then rechaza el registro automáticamente
    And notifica: "Documento no válido. Por favor, vuelve a subir una foto clara de tu licencia vigente"
    And permite reintentar la carga
