import pandas as pd
import json

print("🚀 Starting Excel to TFVARS conversion...")

try:
    # Read Excel file
    excel_data = pd.read_excel('resources.xlsx', sheet_name=None)
    print("✅ Excel file read successfully")
    
    # Show what's in the file
    print(f"Found sheets: {list(excel_data.keys())}")
    
    for sheet_name, data in excel_data.items():
        print(f"\n📊 {sheet_name}:")
        print(f"Columns: {list(data.columns)}")
        if len(data) > 0:
            print("First row data:")
            for col in data.columns:
                print(f"  {col}: {data.iloc[0][col]}")
    
    # Simple conversion
    tfvars_content = ""
    
    # Process ResourceGroups - Aapke actual structure ke hisaab se
    if 'ResourceGroups' in excel_data:
        rg_df = excel_data['ResourceGroups']
        rgs = {}
        print(f"Processing {len(rg_df)} Resource Groups...")
        
        for _, row in rg_df.iterrows():
            # Aapke ResourceGroups sheet ke columns: Name, Location, Tags
            tags_str = str(row['Tags'])
            tags_dict = {}
            if '=' in tags_str:
                key, value = tags_str.split('=')
                tags_dict = {key.strip(): value.strip()}
            else:
                tags_dict = {"environment": "default"}
                
            rgs[row['Name']] = {
                'location': row['Location'],
                'tags': tags_dict
            }
        tfvars_content += f'resource_groups = {json.dumps(rgs, indent=2)}\n\n'
        print("✅ Processed Resource Groups")
    
    # Process VirtualNetworks
    if 'VirtualNetworks' in excel_data:
        vnet_df = excel_data['VirtualNetworks']
        vnets = {}
        print(f"Processing {len(vnet_df)} Virtual Networks...")
        
        for _, row in vnet_df.iterrows():
            # Aapke VirtualNetworks sheet ke columns: Name, ResourceGroup, Location, AddressSpace
            vnets[row['Name']] = {
                'resource_group_name': row['ResourceGroup'],
                'location': row['Location'],
                'address_space': [row['AddressSpace']]
            }
        tfvars_content += f'virtual_networks = {json.dumps(vnets, indent=2)}\n\n'
        print("✅ Processed Virtual Networks")
    
    # Process Subnets
    if 'Subnets' in excel_data:
        subnet_df = excel_data['Subnets']
        subnets = {}
        print(f"Processing {len(subnet_df)} Subnets...")
        
        for _, row in subnet_df.iterrows():
            # Aapke Subnets sheet ke columns: Name, ResourceGroup, VnetName, AddressSpace
            subnets[row['Name']] = {
                'resource_group_name': row['ResourceGroup'],
                'vnet_name': row['VnetName'],
                'address_prefixes': [row['AddressPrifixes']]
            }
        tfvars_content += f'subnets = {json.dumps(subnets, indent=2)}\n\n'
        print("✅ Processed Subnets")
    
    # Write to file
    with open('terraform.tfvars', 'w') as f:
        f.write(tfvars_content)
    
    print("🎉 terraform.tfvars created successfully!")
    
    # Show generated content
    print("\n📄 Generated content:")
    print(tfvars_content)
    
except Exception as e:
    print(f"❌ Error: {e}")
    import traceback
    traceback.print_exc()