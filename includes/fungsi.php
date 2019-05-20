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
	function tot_desa() {
        $database = new Database();
        $conn = $database->getConnection();
        $list="SELECT DISTINCT l.Desa FROM master_petani p, trans_lahan tl, trans_ang_petani tp, master_peta_lahan l where p.ID_User = tl.ID_User and tl.ID_Lahan = l.ID_Lahan and p.ID_User = tp.ID_User";
        if(!empty($klptani)){
            $list="".$list." and tp.ID_Kelompok_Tani ='$klptani'";
        }
        if(!empty($desa)){
            $list="".$list." and l.Desa='$desa'";
        }
        $stmt = $conn->prepare($list);
        $stmt->execute();
        return $stmt->rowCount();
	}

	function tot_petani($klptani,$desa) {
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
		return $stmt->rowCount();
	}	
	
	function tot_klp_tani() {
        $database = new Database();
        $conn = $database->getConnection();
        $list="SELECT DISTINCT tp.ID_Kelompok_Tani FROM master_petani p, trans_lahan tl, trans_ang_petani tp, master_peta_lahan l where p.ID_User = tl.ID_User and tl.ID_Lahan = l.ID_Lahan and p.ID_User = tp.ID_User";
        if(!empty($klptani)){
            $list="".$list." and tp.ID_Kelompok_Tani ='$klptani'";
        }
        if(!empty($desa)){
            $list="".$list." and l.Desa='$desa'";
        }
        $stmt = $conn->prepare($list);
        $stmt->execute();
        return $stmt->rowCount();
	}
	
?>