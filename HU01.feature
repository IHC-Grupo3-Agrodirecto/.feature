Feature: Registro de productor agrícola
  Como productor agrícola
  Quiero crear una cuenta con mi DNI y ubicación
  Para publicar mi cosecha y unirme a viajes consolidados

  Scenario Outline: Registro exitoso de productor con datos válidos
    Given que el productor accede a la pantalla de registro
    When completa el formulario con los siguientes datos:
      | Campo            | Valor                          |
      | <campo>          | <valor>                        |
    And presiona el botón "Registrarme"
    Then se crea su perfil de productor
    And es redirigido a la pantalla de inicio de la aplicación
    And recibe un mensaje: "Bienvenido, <nombre>"

    Examples:
      | campo                | valor                      |
      | Nombre completo      | Juan Pérez García          |
      | Número de DNI        | 12345678                   |
      | Número de teléfono   | 987654321                  |
      | Ubicación            | Lurín, Lima                |
      | Contraseña           | Segura123!                 |

  Scenario: Validación de contraseña débil
    Given que el productor completa todos los campos
    When ingresa una contraseña de solo 4 caracteres
    And presiona el botón "Registrarme"
    Then el sistema muestra el mensaje: "La contraseña debe tener al menos 6 caracteres"
    And no permite continuar con el registro
    And el formulario permanece con los datos ingresados
