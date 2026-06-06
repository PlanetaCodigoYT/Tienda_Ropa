<?php

//Permiso de conexión a la BD
require '../config/db.php';

session_start();

$mensaje = "";

//El control de acceso
if(!isset($_SESSION['rol']) || $_SESSION['rol'] != 'admin') {
    header('Location: ../index.php');
    exit();
}

//Procesamiento de creación de usuarios
if(isset($_POST['registrar'])) {
    $nombre = $_POST['nombre'];
    $usuario = $_POST['usuario'];
    $password_inicial = $_POST['password']; 
    $rol = $_POST['rol'];

    $password_hasheada = password_hash($password_inicial, PASSWORD_DEFAULT);

    try {
        $stmt = $pdo->prepare("INSERT INTO `usuarios`(`nombre`, `usuario`, `password`, `rol`) VALUES (?, ?, ?, ?)");
        $stmt->execute([$nombre, $usuario, $password_hasheada, $rol]);
        $mensaje = "Usuario creado exitosamente";
    } catch (PDOException $e) {
        $mensaje = "Error al crear el usuario";
    }
}

//Consulta a la tabla de usuarios
$stmt = $pdo->query("SELECT `id`, `nombre`, `usuario`, `rol` FROM `usuarios`");
$lista_usuarios = $stmt->fetchAll();

//Procesamiento del eliminar
if(isset($_GET['eliminar'])){
    $id_a_eliminar = $_GET['eliminar'];

    if($id_a_eliminar == $_SESSION['user_id']){
    $mensaje = "No puedes eliminarte a ti mismo";
} else {
    $stmt = $pdo->prepare("DELETE FROM `usuarios` WHERE id = ?");
    $stmt->execute([$id_a_eliminar]);
    header('Location: usuarios.php');
}
}

include '../templates/header.php';
?>

<h2 class="mt-4 mb-4 text-center">Gestión de usuarios</h2>

<div class="card mb-4">
    <div class="card-header">Registro de nuevo usuario</div>
    <div class="card-body">
        <form action="" method="post">
            <div class="mb-3">
                <input type="text" class="form-control" name="nombre" id="" aria-describedby="helpId"
                    placeholder="Digite el nombre completo del usuario" required autocomplete="off" />
            </div>
            <div class="mb-3">
                <input type="text" class="form-control" name="usuario" id="" aria-describedby="helpId"
                    placeholder="Digite el nick de usuario" required autocomplete="off" />
            </div>
            <div class="mb-3">
                <input type="password" class="form-control" name="password" id="" aria-describedby="helpId"
                    placeholder="Digite el password inicial de usuaio" required autocomplete="off" />
            </div>
            <div class="mb-3">
                <select class="form-select form-select" name="rol" id="" required>
                    <option value="" selected disabled>Tipo de rol</option>
                    <option value="admin">Administrador</option>
                    <option value="empleado">Empleado</option>
                </select>
            </div>
            <div class="text-center">
                <button type="submit" class="btn btn-primary" name="registrar">
                    Crear usuario
                </button>

            </div>
        </form>
    </div>
    <div class="card-footer text-body-secondary"></div>
</div>

<hr>

<h3 class="text-center mt-3">Usuarios registrados en el sistema</h3>
<?php if($mensaje): ?>
<p><?php echo $mensaje; ?></p>
<?php endif; ?>
<div class="table-responsive">
    <table class="table table-bordered table-hover" style="text-align: center;">
        <thead>
            <tr>
                <th>ID</th>
                <th>Nombre</th>
                <th>Usuario</th>
                <th>Rol</th>
                <th>Acciones</th>
            </tr>
        </thead>
        <tbody>
            <?php foreach($lista_usuarios as $u): ?>
            <tr>
                <td><?php echo $u['id']; ?></td>
                <td><?php echo $u['nombre']; ?></td>
                <td><?php echo $u['usuario']; ?></td>
                <td><strong><?php echo strtoupper($u['rol']); ?></strong></td>
                <td>
                    <a name="" id="" class="btn btn-danger" href="?eliminar=<?php echo $u['id']; ?>"
                        role="button">Eliminar</a>

                </td>
            </tr>
            <?php endforeach; ?>
        </tbody>
    </table>
</div>

<?php
include '../templates/footer.php';
?>