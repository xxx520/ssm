package service;

import org.openstack4j.api.OSClient.OSClientV3;
import org.openstack4j.model.common.ActionResponse;
import org.openstack4j.model.common.Identifier;
import org.openstack4j.model.compute.FloatingIP;
import org.openstack4j.openstack.OSFactory;


public class TestOpenstack4j {
	public static void main(String[] args) {
		//浮动ip
		//https://blog.csdn.net/u011328417/article/details/75578389
		OSClientV3 os = OSFactory.builderV3().endpoint("http://10.0.0.11:5000/v3")
				.credentials("zph", "123456", Identifier.byName("default"))
				.scopeToProject(Identifier.byId("7e0ba2f4b7e74f0eb21fec7642d42544")).authenticate();
		
		FloatingIP ip = os.compute().floatingIps().allocateIP("ext_zwn");//从上面查出来的浮动IP池中分配分配一个浮动ip地址
		ActionResponse r = os.compute().floatingIps().addFloatingIP(
				os.compute().servers().get("11e44f47-d802-425c-8f6e-825eb751d070"), "192.168.10.46",
				ip.getFloatingIpAddress());
	
		System.out.println(ip);
	}
	
}
