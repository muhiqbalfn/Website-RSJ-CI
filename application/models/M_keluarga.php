<?php 
defined('BASEPATH') OR exit('No direct script access allowed');

class M_keluarga extends CI_Model{

	public function __construct()
	{
		parent::__construct();
	}

	public function getKeluarga()
	{
		$this->db->select('keluarga.*, user.username as uname, pasien.nama as pasien');
        $this->db->from('keluarga');
        $this->db->join('user','keluarga.id_user=user.id');
        $this->db->join('pasien','keluarga.id_pasien=pasien.id_pasien');
        $query = $this->db->get();
        return $query->result();
	}

	public function getKeluargaWhereId($where)
	{
		$query=$this->db->query("SELECT * FROM keluarga WHERE id='$where'");
		if($query->num_rows()>0){
			foreach ($query->result() as $value) {
				$data=array(
					'id' => $value->id,
					'id_pasien' => $value->id_pasien,
					'id_user' => $value->id_user,
					'nama' => $value->nama,
					'alamat' => $value->alamat,
					'no_tlp' => $value->no_tlp,
					'hubungan' => $value->hubungan
				);
			}
		}
		return $data;
	}

	//return result digunakan untuk mengembalikan nilai berupa array
	//ps: kalau masukin data ke database gak perlu return result soale nggak ngembaliin apa2 
	public function insert($data)
	{
		$this->db->insert('keluarga', $data);
	}

	public function update($data, $where){
		$this->db->set($data);
		$this->db->where("id", $where);
		$this->db->update('keluarga', $data);
	}

	public function delete($where){
		$this->db->query("DELETE FROM keluarga where id='$where'");
	}
}
?>