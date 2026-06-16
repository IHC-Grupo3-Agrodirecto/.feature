Feature: Inicio de sesión en la plataforma
  Como usuario registrado de AgroDirecto
  Quiero ingresar con mi teléfono y contraseña
  Para gestionar mis publicaciones de carga de forma privada y segura

  Scenario Outline: Acceso exitoso con credenciales válidas
    Given que el usuario se encuentra en la pantalla de login
    When ingresa sus credenciales:
      | Campo              | Valor                |
      | <campo>            | <valor>              |
    And presiona el botón "Iniciar sesión"
    Then accede a su panel de control personal
    And visualiza su nombre: "Bienvenido, <nombre>"
    And se muestra el dashboard correspondiente a su rol

    Examples:
      | campo                   | valor        | nombre     |
      | Número de teléfono      | 987654321    | Juan       |
      | Contraseña              | Segura123!   |            |

  Scenario: Intento de acceso con credenciales incorrectas
    Given que el usuario intenta iniciar sesión
    When ingresa un teléfono o contraseña incorrectos
    And presiona "Iniciar sesión"
    Then el sistema muestra el mensaje: "Usuario o contraseña incorrectos"
    And no permite el acceso a la aplicación
    And sugerencias: "¿Olvidaste tu contraseña? Haz clic aquí" 
