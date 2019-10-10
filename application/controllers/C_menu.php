<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class C_menu extends CI_Controller {

	function __construct(){ 
		parent::__construct(); 
		
		if($this->session->userdata('level') == "0") {  
			redirect(base_url('C_admin'));  
		} else if ($this->session->userdata('level') == "1") {
			redirect(base_url('C_dokter')); 
		} else if ($this->session->userdata('level') == "2") {
			redirect(base_url('C_perawat')); 
		} else if ($this->session->userdata('level') == "3") {
			redirect(base_url('C_apoteker'));
		} else if ($this->session->userdata('level') == "4") {
			redirect(base_url('C_keluarga'));
		}
	} 

	public function index()
	{
		$this->load->view('menu/home');
	}

	public function login() {
		$this->load->view('menu/login');
	}
}
