<?php
	//query
	function query($query) {		
		$result = @mysql_query($query) 
		or die("<META HTTP-EQUIV = 'Refresh' Content = '0; URL = ./'>");
		return $result;
	}

	function fetch_row($query) {
		$tmp = query($query);
		list($result) = mysql_fetch_row($tmp);
		return $result;
	}

	function num_rows($query) {
		$tmp = query($query);
		$jum = mysql_num_rows($tmp);
		return $jum;
	}
	
	function valid_form($string){
		return htmlentities(addslashes($string));
	}
	
	//format
	
	function tgl_eng($tgl2){
			$tanggal = substr($tgl2,0,2);
			$bulan = substr($tgl2,3,2);
			$tahun = substr($tgl2,6,4);
			return $tahun.'-'.$bulan.'-'.$tanggal;		 
	}
	
	function tgl_ina($tanggal) {
		list($thn,$bln,$tgl)=explode('-',$tanggal);
		return $tgl.'-'.$bln.'-'.$thn;
	}

	
	//combo
	function selected($t1,$t2) {
		if (trim($t1)==trim($t2)) return "selected";
		else return "";
	}

	// kolom select
	function kol_login($kol,$id) {
		return fetch_row("SELECT ".$kol." FROM tb_login WHERE username='$id'");
	}

	function kol_warga($kol,$id) {
		return fetch_row("SELECT ".$kol." FROM tb_warga WHERE id_warga='$id'");
	}

	function kol_keb($kol,$id) {
		return fetch_row("SELECT ".$kol." FROM tb_keb WHERE id_keb='$id'");
	}
	
	// Statistik
	function tot_dis($kdis,$kdus) {
		$list="SELECT * FROM tb_warga where id_warga not in ('')";
		if(!empty($kdis)){
		$list="".$list." and disabilitas='$kdis'";
		}
		if(!empty($kdus)){
		$list="".$list." and dusun='$kdus'";
		}
		return num_rows($list);
	}
	
	function tot_dus() {

		//if(!empty($kdus)){
		//return num_rows("SELECT * FROM tb_warga group by ".$kdus."");
		//}else{
		return num_rows("SELECT * FROM tb_warga group by dusun");
		//if selected combo_dus;
		//return
		//}

	}

	function tot_laki($kdis,$kdus) {
		$list="SELECT * FROM tb_warga where jeniskelamin='L'";
		if(!empty($kdis)){
		$list="".$list." and disabilitas='$kdis'";
		}
		if(!empty($kdus)){
		$list="".$list." and dusun='$kdus'";
		}
		return num_rows($list);
	}	
	
	function tot_wanita($kdis,$kdus) {
		$list="SELECT * FROM tb_warga where jeniskelamin='P'";
		if(!empty($kdis)){
		$list="".$list." and disabilitas='$kdis'";
		}
		if(!empty($kdus)){
		$list="".$list." and dusun='$kdus'";
		}
		return num_rows($list);
	}


	// validasi
	function cek_username($user) {
		$br = fetch_row("SELECT username FROM tb_login WHERE username='$user'");
		if ($br!='') 
			return true;
		else
			return false;
	}
	
	function cek_email($email, $check_domain = false) {
        if ($check_domain){ }
        if (ereg('^[-!#$%&\'*+\\./0-9=?A-Z^_`a-z{|}~]+'.'@'.
                 '[-!#$%&\'*+\\/0-9=?A-Z^_`a-z{|}~]+\.'.
                 '[-!#$%&\'*+\\./0-9=?A-Z^_`a-z{|}~]+$', $email))
        {
            if ($check_domain && function_exists('checkdnsrr')) {
                list (, $domain)  = explode('@', $email);
                if (checkdnsrr($domain, 'MX') || checkdnsrr($domain, 'A')) {
                    return true;
                }
                return false;
            }
            return true;
        }
        return false;
    }
	
	// pesan
	function pesan_error($s='') {
		echo "<script type=\"text/javascript\">alert(\"Maaf, $s..!!\");window.history.back();</script>";
	}

	function pesan_submit($url='') {
		if ($url==='') $url = './';
		echo "<script type=\"text/javascript\">alert(\"Data Berhasil Disimpan..!!\");</script>";
		echo "<META HTTP-EQUIV = 'Refresh' Content = '0; URL = $url'>";
	}

	function pesan_delete($url='') {
		if ($url==='') $url = './';
		echo "<script type=\"text/javascript\">alert(\"Data Berhasil Dihapus..!!\");</script>";
		echo "<META HTTP-EQUIV = 'Refresh' Content = '0; URL = $url'>";
	}
	
?>