<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class C_admin extends CI_Controller {

	function __construct(){
		parent::__construct();
		$this->load->model('M_user');
		$this->load->model('M_klinik');
		$this->load->model('M_pasien');

		if($this->session->userdata('level') != "0") {  
			redirect('C_menu');  
		}
	}

	public function index()
	{
		$this->load->view('admin/index');
	}

	public function user() {
		$this->load->view('admin/user');
	}

	public function apoteker() {
		$data['user']=$this->M_user->listUser();
		$this->load->view('admin/apoteker', $data);
	}

	public function dokter() {
		$data['user']=$this->M_user->listUser();
		$data['klinik']=$this->M_klinik->listKlinik();
		$this->load->view('admin/dokter', $data);
	}

	public function perawat() {
		$data['user']=$this->M_user->listUser();
		$this->load->view('admin/perawat', $data);
	}

	public function pasien() {
		$this->load->view('admin/pasien');
	}

	public function obat() {
		$this->load->view('admin/obat');
	}

	public function klinik() {
		$this->load->view('admin/klinik');
	}

	public function ruangan() {
		$this->load->view('admin/ruangan');
	}

	public function pendaftaran() {
		$data['pasien']=$this->M_pasien->listPasien();
		$data['klinik']=$this->M_klinik->listKlinik();
		$this->load->view('admin/pendaftaran', $data);
	}

	public function keluarga() {
		$data['pasien']=$this->M_pasien->listPasien();
		$data['user']=$this->M_user->listUser();
		$this->load->view('admin/keluarga', $data);
	}

}