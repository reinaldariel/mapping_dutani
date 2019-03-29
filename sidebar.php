<div class="sidebar-menu">
    <header class="logo1">
        <a href="#" class="sidebar-icon"> <span class="fa fa-bars"></span> </a>
    </header>
    <div style="border-top:1px ridge rgba(255, 255, 255, 0.15)"></div>
    <div class="menu">
        <h4>welcome, <?php echo $_SESSION['user']?></h4>
        <ul id="menu" >
            <li><a href="profil.php"><i class="fa fa-user"></i> <span>Profile</span><div class="clearfix"></div></a></li>
            <li><a href="index.php"><i class="fa fa-tachometer"></i> <span>Pemetaan</span><div class="clearfix"></div></a></li>
            <?php if ($_SESSION['kategori']== "ADP"){
                echo '<li id="menu-academico" ><a href="cari.php"><i class="fa fa-search"></i><span>Pencarian</span><div class="clearfix"></div></a></li>';
                echo '<li><a href="daftar_petani.php"><i class="fa fa-map-marker"></i> <span>Daftar Lahan Petani</span><div class="clearfix"></div></a></li>';
            }else{
                echo '<li><a href="daftar_lahan_per_petani.php?id='.$_SESSION['user'].'"><i class="fa fa-map-marker"></i> <span>Lahan</span><div class="clearfix"></div></a></li>';
            }
            ?>
            <li><a href="logout.php"><i class="fa fa-sign-out" aria-hidden="true"></i><span>Logout</span><div class="clearfix"></div></a></li>
        </ul>
    </div>
</div>