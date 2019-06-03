<?php
	// Statistik
//	function tot_lahan($list) {
//		$list="SELECT * FROM master_peta_lahan l,  where id_warga not in ('')";
//		if(!empty($kdis)){
//		$list="".$list." and disabilitas='$kdis'";
//		}
//		if(!empty($kdus)){
//		$list="".$list." and dusun='$kdus'";
//		}
//		return num_rows($list);
//	}
//
	function tot_desa($json) {
        if (isset($_POST['daerah']) and $_POST['daerah'] != ""){
            return $_POST['daerah'];
        }
        else {
            $database = new Database();
            $conn = $database->getConnection();
            $list = "SELECT DISTINCT l.Desa FROM master_petani p, trans_lahan tl, trans_ang_petani tp, master_peta_lahan l where p.ID_User = tl.ID_User and tl.ID_Lahan = l.ID_Lahan and p.ID_User = tp.ID_User";
            if (!empty($json)) {
                $list .= " and tl.ID_Lahan in (";
                foreach ($json as $val) {
                    $list .= $val['ID_Lahan'] . ", ";
                }
                $list = substr($list, 0, -2);
                $list .= ")";
            }
            $stmt = $conn->prepare($list);
            $stmt->execute();
            return $stmt->rowCount();
        }
	}

	function tot_petani($klptani,$desa) {
        if ($_SESSION['kategori'] != 'PET'){
        $database = new Database();
        $conn = $database->getConnection();
	    $list="SELECT DISTINCT DISTINCT tl.ID_User FROM master_petani p, trans_lahan tl, trans_ang_petani tp, master_peta_lahan l where p.ID_User = tl.ID_User and tl.ID_Lahan = l.ID_Lahan and p.ID_User = tp.ID_User";
		if(!empty($klptani)){
		$list="".$list." and tp.ID_Kelompok_Tani ='$klptani'";
		}
		if(!empty($desa)){
		$list="".$list." and l.Desa='$desa'";
		}
        $stmt = $conn->prepare($list);
        $stmt->execute();
		return $stmt->rowCount();}
		else{
            return $_SESSION['nama'];
        }
	}	
	
	function tot_klp_tani($json) {
        $database = new Database();
        $conn = $database->getConnection();
        if (isset($_POST['klptani']) and $_POST['klptani'] != "") {

            $strnama = "SELECT Nama_Kelompok_Tani from master_kel_tani WHERE ID_Kelompok_Tani = '" . $_POST['klptani'] . "'";
            $stmt = $conn->prepare($strnama);
            $stmt->execute();
            $stmt->setFetchMode(PDO::FETCH_ASSOC);
            $result = $stmt->fetchAll();
            foreach ($result as $val) {
                return $val['Nama_Kelompok_Tani'];
            }
        }
        else {
            $list = "SELECT DISTINCT tp.ID_Kelompok_Tani FROM master_petani p, trans_lahan tl, trans_ang_petani tp, master_peta_lahan l where p.ID_User = tl.ID_User and tl.ID_Lahan = l.ID_Lahan and p.ID_User = tp.ID_User";
            if (!empty($json)) {
                $list .= " and tl.ID_Lahan in (";
                foreach ($json as $val) {
                    $list .= $val['ID_Lahan'] . ", ";
                }
                $list = substr($list, 0, -2);
                $list .= ")";
            }
            $stmt = $conn->prepare($list);
            $stmt->execute();
            return $stmt->rowCount();
        }
	}
	
?>