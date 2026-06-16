Feature: Recuperación de contraseña por SMS
  Como usuario de AgroDirecto
  Quiero restablecer mi contraseña por SMS
  Para no perder acceso a mi cuenta en zonas rurales con conectividad limitada

  Scenario Outline: Recuperación exitosa de contraseña
    Given que el usuario se encuentra en la pantalla de "Olvidé mi contraseña"
    When ingresa su número de teléfono:
      | Campo                  | Valor                |
      | <campo>                | <valor>              |
    And presiona "Enviar código"
    Then recibe un código de 6 dígitos por SMS
    And aparece la pantalla: "Ingresa el código que recibiste"
    And después de ingresar el código puede crear una nueva contraseña

    Examples:
      | campo                  | valor                |
      | Número de teléfono     | 987654321            |

  Scenario: Validación de número no registrado
    Given que el usuario accede a recuperación de contraseña
    When ingresa un número de teléfono no registrado
    And presiona "Enviar código"
    Then el sistema muestra: "Número no encontrado en nuestro sistema"
    And sugiere: "¿No tienes cuenta? Regístrate aquí"