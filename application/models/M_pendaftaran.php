<?php 
defined('BASEPATH') OR exit('No direct script access allowed');

class M_pendaftaran extends CI_Model{

	public function __construct()
	{
		parent::__construct();
	}

	public function getPendaftaran()
	{
		$this->db->select('pendaftaran.*, pasien.nama as pasien, klinik.nama as klinik');
        $this->db->from('pendaftaran');
        $this->db->join('pasien','pendaftaran.id_pasien=pasien.id_pasien');
        $this->db->join('klinik','pendaftaran.id_klinik=klinik.id_klinik');
        $query = $this->db->get();
        return $query->result();
	}

	public function getPendaftaranWhereId($where)
	{
		$query=$this->db->query("SELECT * FROM pendaftaran WHERE id_pendaftaran='$where'");
		if($query->num_rows()>0){
			foreach ($query->result() as $value) {
				$data=array(
					'id_pendaftaran' => $value->id_pendaftaran,
					'no_pendaftaran' => $value->no_pendaftaran,
					'id_pasien' => $value->id_pasien,
					'rujukan' => $value->rujukan,
					'id_klinik' => $value->id_klinik,
					'tgl_masuk' => $value->tgl_masuk,
					'status' => $value->status,
					'no_antrian' => $value->no_antrian
				);
			}
		}
		return $data;
	}

	//return result digunakan untuk mengembalikan nilai berupa array
	//ps: kalau masukin data ke database gak perlu return result soale nggak ngembaliin apa2 
	public function insert($data)
	{
		$this->db->insert('pendaftaran', $data);
	}

	public function update($data, $where){
		$this->db->set($data);
		$this->db->where("id_pendaftaran", $where);
		$this->db->update('pendaftaran', $data);
	}

	public function delete($where){
		$this->db->query("DELETE FROM pendaftaran where id_pendaftaran='$where'");
	}
}
?>