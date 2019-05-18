<div class="sidebar-menu">
    <header class="logo1">
        <a href="#" class="sidebar-icon"> <span class="fa fa-bars"></span> </a>
    </header>
    <div style="border-top:1px ridge rgba(255, 255, 255, 0.15)"></div>
    <div class="menu">
        <ul id="menu" >
            <li style="text-align: center"><span>welcome, <?php echo $_SESSION['user']?></span><div class="clearfix"></div></li>
<!--            <li><a href="profil.php"><i class="fa fa-user"></i> <span>Profile</span><div class="clearfix"></div></a></li>-->
            <li><a href="index.php"><i class="fa fa-tachometer"></i> <span>Pemetaan</span><div class="clearfix"></div></a></li>
            <?php if ($_SESSION['kategori']== "ADP"){
//                echo '<li id="menu-academico" ><a href=""><i class="fa fa-search"></i><span>Pencarian</span><div class="clearfix"></div></a></li>';
                echo '<li><a href="daftar_petani.php"><i class="fa fa-map-marker"></i> <span>Daftar Lahan Petani</span><div class="clearfix"></div></a></li>';
                echo '<li><a href="#"><i class="fa fa-map-marker"></i> <span>Peta Persebaran Lahan > </span></span><div class="clearfix"></div></a>
                                        <ul id="menu-academico-sub" >
                                        <li id="menu-academico-avaliacoes" ><a href="showall_lahan.php">Semua</a></li>
										   <li id="menu-academico-avaliacoes" ><a href="showall_lahan_desa.php">Daerah</a></li>
											<li id="menu-academico-avaliacoes" ><a href="showall_lahan_klptani.php">Kelompok Tani</a></li>
											</ul>
                        </li>';
                echo '<li><a href="#"><i class="fa fa-map-marker"></i> <span>Peta Gabungan Lahan > </span><div class="clearfix"></div></a>
                                        <ul id="menu-academico-sub" >
										   <li id="menu-academico-avaliacoes" ><a href="filter_daerah.php">Daerah</a></li>
											<li id="menu-academico-avaliacoes" ><a href="filter_klp_tani.php">Kelompok Tani</a></li>
											</ul>
                        </li>';
            }else{
                echo '<li><a href="daftar_lahan_per_petani.php?id='.$_SESSION['user'].'"><i class="fa fa-map-marker"></i> <span>Lahan</span><div class="clearfix"></div></a></li>';
            }
            ?>
            <li><a href="logout.php"><i class="fa fa-sign-out" aria-hidden="true"></i><span>Logout</span><div class="clearfix"></div></a></li>
        </ul>
    </div>
</div>