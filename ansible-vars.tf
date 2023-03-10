# Export Terraform variable values to a file to be used by Ansible
resource "local_file" "ansible-libreswan-vars" {
  content = <<-DOC
    # Ansible vars_file containing variable values from Terraform.
    # Generated by Terraform mgmt configuration.
    onprem_cpe_local_ip: ${oci_core_instance.onprem_libreswan.private_ip}
    onprem_cpe_public_ip: ${oci_core_instance.onprem_libreswan.public_ip}
    onprem_oci_tunnel1_headend: ${data.oci_core_ipsec_connection_tunnels.onprem_ipsec_tunnels.ip_sec_connection_tunnels[0].vpn_ip}
    onprem_oci_tunnel2_headend: ${data.oci_core_ipsec_connection_tunnels.onprem_ipsec_tunnels.ip_sec_connection_tunnels[1].vpn_ip}
    onprem_shared_secret_psk1: ${data.oci_core_ipsec_config.onprem_ipsec_config.tunnels[0].shared_secret}
    onprem_shared_secret_psk2: ${data.oci_core_ipsec_config.onprem_ipsec_config.tunnels[1].shared_secret}
    multicloud_cpe_local_ip: ${oci_core_instance.multicloud_libreswan.private_ip}
    multicloud_cpe_public_ip: ${oci_core_instance.multicloud_libreswan.public_ip}
    multicloud_oci_tunnel1_headend: ${data.oci_core_ipsec_connection_tunnels.multicloud_ipsec_tunnels.ip_sec_connection_tunnels[0].vpn_ip}
    multicloud_oci_tunnel2_headend: ${data.oci_core_ipsec_connection_tunnels.multicloud_ipsec_tunnels.ip_sec_connection_tunnels[1].vpn_ip}
    multicloud_shared_secret_psk1: ${data.oci_core_ipsec_config.multicloud_ipsec_config.tunnels[0].shared_secret}
    multicloud_shared_secret_psk2: ${data.oci_core_ipsec_config.multicloud_ipsec_config.tunnels[1].shared_secret}
    oci_hub_cidr: ${oci_core_vcn.hub_vcn.cidr_block}
    oci_spoke_cidr: ${oci_core_vcn.spoke_vcn.cidr_block}
    DOC
  filename = "./ansible-libreswan-vars.yml"
}