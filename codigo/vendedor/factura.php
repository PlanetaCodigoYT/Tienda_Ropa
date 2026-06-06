<?php
session_start();

//El control de acceso
if(!isset($_SESSION['rol']) || $_SESSION['rol'] != 'empleado') {
    header('Location: ../index.php');
    exit();
}

require '../config/db.php';

//REcepción del id de la factura
$id_venta = $_GET['id'];

// Consultar la tabla ventas
$stmt_v = $pdo->prepare("SELECT v.*, u.nombre AS vendedor 
                         FROM ventas v 
                         JOIN usuarios u ON v.id_vendedor = u.id 
                         WHERE v.id = ?");
$stmt_v->execute([$id_venta]);
$venta = $stmt_v->fetch();

// consulta de la venta
$stmt_d = $pdo->prepare("SELECT dv.*, p.nombre 
                         FROM detalle_ventas dv 
                         JOIN productos p ON dv.id_producto = p.id 
                         WHERE dv.id_venta = ?");
$stmt_d->execute([$id_venta]);
$detalles = $stmt_d->fetchAll();

include '../templates/header.php';
?>

<div class="mt-5" style="max-width: 600px; margin: 0 auto; border: 1px solid #ddd; padding: 20px; background: #fff;">
    <h2 style="text-align: center;">TICKET DE VENTA</h2>
    <p class="text-center">Planeta Código Store</p>
    <hr>
    <p><strong>Factura Nro. </strong><?php echo $venta['id']; ?></p>
    <p><strong>Fecha: </strong><?php echo $venta['fecha']; ?></p>
    <p><strong>Atendido por: </strong><?php echo $venta['vendedor']; ?></p>

    <table width="100%" style="margin-top: 20px;">
        <thead>
            <tr style="border-bottom: 2px solid #000; text-align: center;">
                <th>Producto</th>
                <th>Cant.</th>
                <th>P. unit.</th>
                <th>Subtotal</th>
            </tr>
        </thead>
        <tbody>
            <?php foreach ($detalles as $d): ?>
            <tr>
                <td><?php echo $d['nombre']; ?></td>
                <td style="text-align: center;"><?php echo $d['cantidad']; ?></td>
                <td style="text-align: center;">$ <?php echo $d['precio_unitario']; ?></td>
                <td style="text-align: center;">$ <?php echo $d['cantidad'] * $d['precio_unitario']; ?></td>
            </tr>
            <?php endforeach; ?>
        </tbody>
    </table>
    <hr>
    <h3 style="text-align: right;">TOTAL: $<?php echo $venta['total']; ?></h3>

    <div style="margin-top: 30px; text-align: center;">
        <button onclick="window.print()" style="padding: 10px 20px; cursor: pointer;">Imprimir ticket</button>
        <br><br>
        <a href="catalogo.php" style="color: blue; text-decoration: none;">
            Volver al catálogo</a>
    </div>
</div>

<?php
include '../templates/footer.php';
?>