<div class="sidebar-menu">
    <header class="logo1">
        <a href="#" class="sidebar-icon"> <span class="fa fa-bars"></span> </a>
    </header>
    <div style="border-top:1px ridge rgba(255, 255, 255, 0.15)"></div>
    <div class="menu">
        <ul id="menu" >
            <li><a><i class="fa fa-user"></i><span>welcome, <?php echo $_SESSION['user']?></span><div class="clearfix"></div></a></li>
<!--            <li><a href="profil.php"><i class="fa fa-user"></i> <span>Profile</span><div class="clearfix"></div></a></li>-->
            <li><a href="index.php"><i class="fa fa-tachometer"></i> <span>Pemetaan</span><div class="clearfix"></div></a></li>
            <?php if ($_SESSION['kategori']== "ADP"){
//                echo '<li id="menu-academico" ><a href=""><i class="fa fa-search"></i><span>Pencarian</span><div class="clearfix"></div></a></li>';
                echo '<li><a href="daftar_petani.php"><i class="fa fa-map-marker"></i> <span>Daftar Lahan Petani</span><div class="clearfix"></div></a></li>';
                echo '<li><a href="showall_lahan.php"><i class="fa fa-map-marker"></i> <span>Peta Persebaran Lahan</span></span><div class="clearfix"></div></a></li>';
                echo '<li><a href="filter.php"><i class="fa fa-map-marker"></i> <span>Peta Gabungan Lahan</span><div class="clearfix"></div></a></li>';
            }else{
                echo '<li><a href="daftar_lahan_per_petani.php?id='.$_SESSION['user'].'"><i class="fa fa-map-marker"></i> <span>Lahan</span><div class="clearfix"></div></a></li>';
            }
            ?>
            <li><a href="service/logout.php"><i class="fa fa-sign-out" aria-hidden="true"></i><span>Logout</span><div class="clearfix"></div></a></li>
        </ul>
    </div>
</div>