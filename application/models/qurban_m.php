<?php

class Qurban_m extends CI_Model
{
    public function __construct()
    {
        parent::__construct();
    }
    public function get($id = null, $limit = 5, $offset = 0)
    {
        if ($id == null) {
            return $this->db->get('qurban', $limit, $offset)->result();
        } else {
            return $this->db->get_where('qurban', ['nama' => $id])->result_array();
        }
    }
    public function count()
    {
        return $this->db->get('qurban')->num_rows();
    }

    public function add($data)
    {
        try {
            $this->db->insert('qurban', $data);
            $error = $this->db->error();
            if (!empty($error['code'])) {
                throw new Exception('Terjadi kesalahan: ' / $error['message']);
                return false;
            }
            return ['status' => true, 'data' => $this->db->affected_rows()];
        } catch (Exception $ex) {
            return ['status' => false, 'msg' => $ex->getMessage()];
        }
    }
    public function update($id, $data)
    {
        try {
            $this->db->update('qurban', $data, ['telpon' => $id]);
            $error = $this->db->error();
            if (!empty($error['code'])) {
                throw new Exception('Terjadi kesalahan: ' / $error['message']);
                return false;
            }
            return ['status' => true, 'data' => $this->db->affected_rows()];
        } catch (Exception $ex) {
            return ['status' => false, 'msg' => $ex->getMessage()];
        }
    }
    public function delete($id)
    {
        try {
            $this->db->delete('qurban', ['telpon' => $id]);
            $error = $this->db->error();
            if (!empty($error['code'])) {
                throw new Exception('Terjadi kesalahan: ' / $error['message']);
                return false;
            }
            return ['status' => true, 'data' => $this->db->affected_rows()];
        } catch (Exception $ex) {
            return ['status' => false, 'msg' => $ex->getMessage()];
        }
    }
}
