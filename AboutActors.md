# Actores en Swift: Concurrencia Segura y Sencilla

## 1. Introducción (5 min)

### ¿Qué son los actores?

Los actores son un tipo de referencia (como las clases) introducidos en Swift 5.5 que proporcionan **aislamiento de datos** y seguridad en concurrencia de forma automática.

### Problema que resuelven

```swift
// SIN ACTORES: Código con potenciales problemas de concurrencia
class Counter {
    var value = .zero

    func increment() {
        value += 1
    }

    func getValue() -> Int {
        value
    }
}

// Este código es vulnerable a condiciones de carrera cuando se accede desde múltiples hilos
let counter: Counter = .init()

DispatchQueue.concurrentPerform(iterations: 1000) { _ in
    counter.increment()
}

print("Valor final: \(counter.getValue()))") // Puede no ser 1000
```

## 2. Fundamentos de los Actores (7 min)

### Características principales

- **Palabra clave**: `actor` en lugar de `class`
- **Aislamiento**: Cada actor protege su estado mutable
- **Sincronización automática**: Swift maneja los accesos concurrentes
- **Referencias**: Son tipos de referencia (como las clases)

### Sintaxis básica

```swift
// Declaración de un actor
actor Counter {
    private var value = .zero

    func increment() {
        value += 1
    }

    func getValue() -> Int {
        return value
    }
}
```

### Cómo funcionan

- Los actores crean una **región de exclusión mutua** alrededor de sus datos
- Las llamadas a métodos desde fuera del actor son **asíncronas** (`await`)
- Las llamadas dentro del mismo actor son **síncronas** (sin `await`)

## 3. Usando Actores (8 min)

### Ejemplo práctico

```swift
// CON ACTORES: Solución segura para concurrencia
actor Counter {
    private var value = .zero

    func increment() {
        value += 1
    }

    func getValue() -> Int {
        return valor
    }
}

// Uso en código concurrente
func executeCounting() async {
    let counter: Counter = .init()

    // Necesitamos crear múltiples tareas
    await withTaskGroup(of: Void.self) { group in
        for _ in 1...1000 {
            group.addTask {
                await counter.increment()
            }
        }
    }

    let finalValue: Int = await counter.getValue()
    print("Valor final: \(finalValue)") // Siempre será 1000
}

// Ejecución
Task {
    await executeCounting()
}
```

### Acceso a propiedades

```swift
actor Profile {
    var name: String
    var age: Int

    init(name: String, age: Int) {
        self.name = name
        self.age = age
    }

    func incrementAge() {
        age += 1
    }
}

// Uso
Task {
    let profile: Profile = .init(name: "Ana", age: 30)

    // Acceso a propiedades requiere await
    print("Nombre: \(await profile.name)")

    await profile.incrementAge()
    print("Nueva edad: \(await profile.age)")
}
```

## 4. MainActor (5 min)

### ¿Qué es MainActor?

`MainActor` es un actor global predefinido que representa el hilo principal, donde debe ejecutarse todo el código de UI.

### Uso de MainActor

```swift
// Marcar una clase completa para que se ejecute en el hilo principal
@MainActor
class ViewModel {
    var data: [String] = []

    func loadData() {
        // Este código siempre se ejecuta en el hilo principal
        data = ["Uno", "Dos", "Tres"]
    }
}

// O marcar solo un método específico
class Repository {
    private var cache: [String: Any] = [:]

    func loadData() async -> [String] {
        // Este código puede ejecutarse en cualquier hilo
        return ["Datos", "del", "servidor"]
    }

    @MainActor
    func updateUI(with data: [String]) {
        // Este código siempre se ejecuta en el hilo principal
        print("Actualizando UI con: \(data)")
    }
}
```

## 5. GlobalActor (3 min)

### Actores globales personalizados

```swift
// Definir un actor global personalizado
@globalActor
actor DatabaseActor {
    static let shared = DatabaseActor()
}

// Usar el actor global para aislar el acceso a la base de datos
@DatabaseActor
class Database {
    private var connections = 0

    func connect() {
        connections += 1
        print("Nueva conexión. Total: \(connections)")
    }

    func disconnect() {
        connections -= 1
        print("Conexión cerrada. Total: \(connections)")
    }
}
```

## 6. Mejores Prácticas y Casos de Uso (2 min)

### Cuándo usar actores

- Cuando tenemos **estado mutable compartido** entre hilos
- Para **gestores de recursos** (caché, conexiones, etc.)
- Para **modelar entidades** con concurrencia interna

### Limitaciones

- Hay un pequeño **overhead** en comparación con clases normales
- Las llamadas asíncronas pueden complicar el código si se abusa
- No son una solución para todos los problemas de concurrencia

## Resumen

1. Los actores son un tipo de dato que proporciona **seguridad en concurrencia automática**
2. Protegen su estado interno contra accesos simultáneos
3. Requieren `await` para acceder desde fuera
4. `MainActor` permite ejecutar código en el hilo principal
5. Los actores globales permiten definir dominios de aislamiento personalizados

## Recursos adicionales

- [Documentación oficial de Swift sobre Actores](https://developer.apple.com/documentation/swift/actor)
- [Documentación sobre MainActor](https://developer.apple.com/documentation/swift/mainactor)
- [Documentación sobre GlobalActor](https://developer.apple.com/documentation/swift/globalactor)
- [Artículo de SwiftLee sobre Actores](https://www.avanderlee.com/swift/actors/)
- [Guía de Hacking with Swift sobre Actores](https://www.hackingwithswift.com/quick-start/concurrency/what-is-an-actor-and-why-does-swift-have-them)
