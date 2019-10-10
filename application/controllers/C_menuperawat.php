<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class C_menuperawat extends CI_Controller {

	function __construct(){
		parent::__construct();
		
	}

	public function index()
	{
		$this->load->view('perawat/index');
	}

	public function user() {
		$this->load->view('admin/user');
	}

}