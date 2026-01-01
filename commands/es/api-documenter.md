# Documentador de API

Por favor, ayudame a documentar todas las APIs de este proyecto de forma sistematica:

## 1. Descubrimiento de APIs
Encuentra todos los endpoints de API usando estos patrones de busqueda:

### Express/Node.js
```bash
chs find-code "app\.(get\|post\|put\|delete\|patch)\|router\.(get\|post\|put\|delete\|patch)"
chs find-file "*route*\|*api*\|*controller*"
```

### Decoradores (NestJS, TypeScript)
```bash
chs find-code "@(Get\|Post\|Put\|Delete\|Patch)\|@Controller\|@Route"
```

### Otros Frameworks
```bash
# Python (FastAPI, Flask, Django)
chs find-code "@app\.(get\|post\|put\|delete)\|@router\|@route"
chs find-code "path\(\|urlpatterns\s*=\|views\."

# Rails/Ruby
chs find-code "resources\s\|get\s['\"]\/\|post\s['\"]\/\|match\s['\"]\/"

# Java/Spring
chs find-code "@(Get\|Post\|Put\|Delete\|Request)Mapping\|@RestController"

# Go
chs find-code "HandleFunc\|Handle\(.*\"\/"
```

## 2. Documentar Cada Endpoint
Para cada endpoint encontrado, documenta:

### Detalles del Endpoint
- **Metodo**: GET, POST, PUT, DELETE, PATCH
- **Ruta**: URL completa con parametros
- **Descripcion**: Que hace este endpoint
- **Autenticacion**: Requerida? Tipo?

### Solicitud
- **Parametros**: Parametros de query, parametros de URL
- **Cuerpo**: Estructura esperada de JSON/formulario
- **Headers**: Headers requeridos

### Respuesta
- **Respuesta Exitosa**: Codigo de estado y estructura del cuerpo
- **Respuestas de Error**: Codigos de error comunes y significados
- **Headers de Respuesta**: Headers especiales

### Ejemplo
```bash
# Generar ejemplo con curl
curl -X METHOD 'http://localhost:3000/path' \
  -H 'Content-Type: application/json' \
  -d '{"example": "data"}'
```

## 3. Generar Formatos de Documentacion

### Formato README.md
Crear secciones organizadas por recurso:
- Endpoints de usuarios
- Endpoints de autenticacion
- Endpoints de productos
- etc.

### Formato OpenAPI/Swagger
Si aplica, generar especificacion OpenAPI:
```yaml
paths:
  /users:
    get:
      summary: Listar usuarios
      responses:
        200:
          description: Exito
```

### Coleccion Postman
Crear coleccion importable con todos los endpoints

## 4. Lista de Verificacion de Validacion
- [ ] Todos los endpoints descubiertos estan documentados
- [ ] Requisitos de autenticacion claros
- [ ] Ejemplos de solicitud/respuesta proporcionados
- [ ] Casos de error documentados
- [ ] Limitacion de tasa anotada
- [ ] Configuracion CORS documentada

## 5. Auto-generar Ejemplos
Usar codigo real para crear ejemplos realistas:
- Encontrar archivos de prueba: `chs find-file "*.test.*" | xargs grep -l "request\|fetch"`
- Extraer llamadas API reales de las pruebas
- Usar como ejemplos de documentacion

Crea una referencia de API completa que los desarrolladores puedan usar inmediatamente!
