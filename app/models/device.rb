class Device < ActiveRecord::Base
  
#  establish_connection :tud_config
#  
#  self.primary_key = 'DevID'
#  self.table_name = 'Device'
#  
#  belongs_to :company, foreign_key: "CompanyID"
#  belongs_to :workstation, foreign_key: "WorkstationID"
  
  #############################
  #     Instance Methods      #
  ############################
  
  def scale_read
    xml_string = "<?xml version='1.0' encoding='UTF-8'?>
      <SOAP-ENV:Envelope xmlns:SOAP-ENV='http://schemas.xmlsoap.org/soap/envelope/' xmlns:mime='http://schemas.xmlsoap.org/wsdl/mime/' xmlns:ns1='urn:TUDIntf' xmlns:soap='http://schemas.xmlsoap.org/wsdl/soap/' xmlns:soapenc='http://schemas.xmlsoap.org/soap/encoding/' xmlns:tns='http://tempuri.org/' xmlns:xs='http://www.w3.org/2001/XMLSchema' xmlns:xsd='http://www.w3.org/2001/XMLSchema' xmlns:xsi='http://www.w3.org/2001/XMLSchema-instance'>
         <SOAP-ENV:Body>
            <mns:ReadScale xmlns:mns='urn:TUDIntf-ITUD' SOAP-ENV:encodingStyle='http://schemas.xmlsoap.org/soap/encoding/'>
               <WorkstationIP xsi:type='xs:string'>#{ENV['PROXY_IP']}</WorkstationIP>
               <WorkstationPort xsi:type='xs:int'>#{self.LocalListenPort}</WorkstationPort>
               <ConsecReads xsi:type='xs:int'>5</ConsecReads>
            </mns:ReadScale>
         </SOAP-ENV:Body>
      </SOAP-ENV:Envelope>"
    client = Savon.client(wsdl: ENV['TUD_WSDL_URL'])
    response = client.call(:read_scale, xml: xml_string)
    data = response.to_hash
    return data[:read_scale_response][:return]
  end
  
  #############################
  #     Class Methods      #
  #############################
  
  def self.pos_payment(workstion_id, amount)
    xml_string = "<SOAP-ENV:Envelope xmlns:SOAP-ENV='http://schemas.xmlsoap.org/soap/envelope/' xmlns:mime='http://schemas.xmlsoap.org/wsdl/mime/' xmlns:soap='http://schemas.xmlsoap.org/wsdl/soap/' xmlns:soapenc='http://schemas.xmlsoap.org/soap/encoding/' xmlns:tns='http://tempuri.org/' xmlns:xs='http://www.w3.org/2001/XMLSchema' xmlns:xsd='http://www.w3.org/2001/XMLSchema' xmlns:xsi='http://www.w3.org/2001/XMLSchema-instance'>
      <SOAP-ENV:Body>
         <mns:POSPayment xmlns:mns='urn:CheckServiceIntf-ICheckService' SOAP-ENV:encodingStyle='http://schemas.xmlsoap.org/soap/encoding/'>
            <WorkstationID xsi:type='xs:int'>1</WorkstationID>
            <Amount xsi:type='xs:double'>20</Amount>
         </mns:POSPayment>
      </SOAP-ENV:Body>
    </SOAP-ENV:Envelope>"
#    client = Savon.client(wsdl: ENV['JPEGGER_WSDL_URL'])
#    client = Savon.client(wsdl: 'http://71.41.52.58/checkservice/checkservice.dll/wsdl/ICheckService')
    client = Savon.client(wsdl: 'http://192.168.111.49/checkservice/checkservice.dll/wsdl/ICheckService')
    
    client.call(:pos_payment, xml: xml_string)
  end
  
end

