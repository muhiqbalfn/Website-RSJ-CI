<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class C_antrian extends CI_Controller {

	function __construct(){
		parent::__construct();
		$this->load->model('M_antrian');
	}

	public function index()
	{
		
	}

	public function getAjax()
	{
		$data['data'] = $this->M_antrian->getPendaftaran();
		echo json_encode($data);
	}

	public function proses() {
		$id = $this->uri->segment(3);
		$this->M_antrian->updateStatus($id);
		$this->load->view('dokter/pemeriksaan');
	}
}