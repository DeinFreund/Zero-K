return{
    font="LuaUI/Fonts/ru/FreeSansBoldKOI8R.ttf", 
	-- ��� � (�� �� �) ������ ���� �������� �� `
	-- �=255 , � ��� ����������� ������ � Spring Engine
	-- ���� ����� ����������� � ������ ` ������ ���������� �
	-- All � (not �) must be replaced by ` 
	-- The code of the Symbol � is 255 which is color control code for Spring Engine
	-- This font dispaly � instead of `
	
	-- We must know who we should blame if a translation is sucks.  
    units={
		-- Clocaks
		-- Cloaky Bot Factory (banana_Ai)
		factorycloak={
			description="���������� ��������� �����, ������ 10m/s",
			helptext="����� ������������ �� ���� ������� ���������� ������������� ��� � �������� ��� ������ ����� ��������� ������� �����������, ���������� � EMP ������. �������� �����: ���(Glave), ����(Rocko), ����(Warrior), ����(Zeus) � �����(Hammer).",
		},
		-- Rector (banana_Ai)
		armrectr={
			description="��������� �������� �����-���������, ������ 5 m/s",
			helptext="������ ����ݣ� ��������� ����������� ����� � ������������ ����������� �����������, ��� ��������� ��� ������� � ������, ��������� ������������.",
		},
		-- Glave (banana_Ai, banana_king_ChvaN)
		armpw={
			description="����� �����-������",
			helptext="������� � ��ۣ���, ���� ����� ����������� � ��������� �����������, ��������� � ������� ������� ���� ��������� ����������. ������ ��� ������ �������� �������������� ������� � ������ � �������� ������.",
		},
		-- Scythe (banana_Ai)
		spherepole={
			description="��������� �����-������",
			helptext="������ ������� ���� ���-�� ��������� ���������� ����� � ����, �� ������������ ��������� ����������� ��������� ��� ������������� ����� ������� ���������� � ���������� ���������.",
		},
		
		-- Rocko (banana_Ai)
		armrock={
			description="������� ����� (������ �����)",
			helptext="���� �������� ����������, �������������� � ������� ��������, �� ��� �������������� ���������� ��������. ������ ������ ������������ ���� - ��������� �� � ����� � ����� ����� �� ���������� � ����������� ��������� ���������. ������� � ��Σ������� ����� ����� ��������� ��� ����, ��� ��� ����� ������������� �� �����.",
		},
		-- Warrior (banana_Ai)
		armwar={
			description="����� � �������� ������",
			helptext="�����, ������� �������������� ����ͣ��, �������� ���������� ������ ��������, �� ����� ������� ���أ���� ���� � ����� ������ ������. ������, ��� �� ����� ���������� �� ������������ ��������. ��-�� ����� �������� ����� ���� ����� ���������� ������������� �������.",
		},
		-- Zeus (banana_Ai)
        armzeus={
            description="���������/�������� ������ �����",
            helptext="�������� � ��������� ������ ������ ����� ���� ������ ������� ���������� ���� ��� ������� �����, �� ��� ��� ���� ��� �� ������ ������� � ��� ���� ������������ ������������. ������������� �� ����� ����� ���� ������� ������ �� �������. ",
		},
		-- Hammer (banana_Ai)
		armham={
			description="����� ����������/�������-����� ",
			helptext="����� ���������� ���������� ������, ������������� �� ��������� ����������� ������������ ������� � ����������� �������� �� �������������� ����������. �� ������ �� ��, ��� ����� ���������� ������ ��������� ������, ��� ���� �������� �� �������� � ������ ������� ������.",
		},
		-- Sharpshooter (Kmar)
		armsnipe={
			description="������� ������� (�������/��������)",
			helptext="�������������� ���أ �������� ������� �������� ����, �� ������ ����� ����. �� ����� ��������, ������ ���������, �� ��� ������ ������ ��� �������. ��� ����� ������� ������� ��� �����������, ������, ���� �� � ��������. ������ ������ ���������� �������� - ����������� �� ����������� ������� ��ۣ���� ���������.",
		},
		-- Jethro (Kmar)
		armjeth={
			description="��� ���������������� �������",
			helptext="������� � ��������� ���������� �� ���� ����, ������ - ������� ��ۣ��� ��������� ��������� ���. �� ����� �������������, ��� ��������� ��� ������������ ����������� ���������������� ������ ��� ������� �� �������� ����� ����������, ������ ������� �� ����������.",
		},
		-- Tick (Kmar)
		armtick={
			description="����������� �������� �����-���",
			helptext="����� ��������� �� ���� �������� � ����� ������, ����� ������������� �� �� ������ ��������, �������� �����, ��� � ����������� � ������ ��������. ��� ����� ������������ ������� ���� ��� ������ �����, ������� �� �������� ţ ����� �� ����, ��� ��� �������� � �������. ����� � ���� ����� ����� ���������� ������������ ���������� ��� ������� �����. �������� � ���� � ������� �������� ���������� ��� ���������� ��ۣ���� ���������, ����� ��� ���������� ��������������. ��� ������� �����������, ���� ������������.",
		},
		-- Eraser (banana_Ai)
		spherecloaker={
			description="�������� ����� � ������������ ����������� � �����",
			helptext="��������� ����ݣ� ����������� �����, ���-�� �������� ����� �� ��������� �������. ����� � ���� ���� ��������� ���� �����������.",
		},
		-- Shields
		-- Shield Bot Factory (Kmar)
		factoryshield={
			description="������� ������� �������, ������ �� ��������� 10 �/�",
			helptext="������� ������� � ������ �������, �� � �� �� ����� ������. ��� ������� ������� ��� ����, ����� ��������� ���������, � ����� ��� ������� �������, �� ������� ��� ���� ��������. ������������� ������ ���������� ������ ����� ���������������. �������� �������: ������, ���������, �����, �����, �������.",
		},
		-- Convict (Kmar)
		cornecro={
			description="���-���������/��������� �����. ������ �� ��������� 5 �/�",
			helptext="����ģ���� - �������� ����������� �����-��������� � ����������: ̣���� ��� ��� ����������� � ��������� ������������� ��������.",
		},
		-- Bandit (Kmar)
		corak={
			description="������-����� ��� ������.",
			helptext="������ ����������� � ��������� � � ��������� ������ ������ ����, �� ��� ����� �� ��, ޣ� ����� ����� ������������ ����������. �������� � ���� � ������� ��������� ������ � ̣����� ��������.",
		},
		-- Rogue (Kmar)
		corstorm={
			description="����� ������� (�������� �����)",
			helptext="������ ������ �������� ��������������, �� ������� ����� �����, ��� ��������� ��� ����� ������� � ������ ������ � ������ ���������� � �������� �� ����, ��� ������������ ������ ������. ������� ������� � �������� ����� �� ����� ���������.",
		},
		-- Thug (Kmar)
		corthud={
			description="��� ��������� �� �����",
			helptext="��� �� ���� �� ����, �� ��������� ������������� �������� ��������� ��� ������ � �������. ������������� ��� ������� ���������� ���� � ������, �� �� �ӣ ����� ����� ���� �������� ������� � ������� �������� ��������� ��� �������������� ��Σ�.",
		},
		-- Outlaw (Kmar)
		cormak={
			description="��� � �������� ������",
			helptext="����� �������� ����������� ���������������� ������� ������ ����, ������� ��������� � ���������� �����������. �������� �� ������������ ����� �����������.",
		},
		-- Felon (Kmar)
		shieldfelon={
			description="������� � �����",
			helptext="���������� ���������� ������� ������ ����, ��� ���������� ������ ��������. ���������� ��� � ������� ������, ����� ��������� �������� ��������.",
		},
		-- Light Vehicles
		-- Light Vehicle Factory
		factoryveh={
			description="���������� ������ ������, ������ �� �������� 10 m/s",
			helptext="������� ������ ����� ������ ������� �� ������� � ����������� ������, ��������� ��� ���������. �������� �����: ����� (Scorcher), ������������ (Ravager), ���������� (Leveler), ����� (Slasher).",
		},
		-- Mason (banana_king_ChvaN)
		corned={
			description="����������� ������ , ������ �� �������� 5 m/s",
			helptext="��������� � �������, �������� (Mason) ����� ������ ��������� ������� �������.",
		},
		-- Dart (banana_Ai, banana_king_ChvaN)
		corfav={
			description="������-������/���������",
			helptext="������� � ��ۣ���, ������� ����� ���� ���������� �������� � ������ ������ ����, ���� ��������� �� ���������� � ̣���� ������� ��� �������� ��� ��� �� ��������� ����� ������� ������.",
		},
		--[[
		-- Scorcher 
		corgator={
			description="������-������",
			helptext="",
		},
		-- Slasher 
		cormist={
			description="",
			helptext="",
		},
		-- Leveler 
		corlevlr={
			description="",
			helptext="",
		},
		-- Ravager  
		corraid={
			description="",
			helptext="",
		},
		-- Dominatrix  
		capturecar={
			description="",
			helptext="",
		},
		-- Wolverine  
		corgarp={
			description="",
			helptext="",
		},
		-- Impaler  
		armmerl={
			description="",
			helptext="",
		},
		-- Crasher  
		vehaa={
			description="",
			helptext="",
		},]]--
		-- Planes
		-- Airplane Plant (banana_king_ChvaN)
		factoryplane={
			description="���������� ����̣��, ������ �� �������� 10 m/s",
			helptext="����� ��������� ���������� ������� ����� ������. �� ���������� ������������ �����������, ������� ����� ������������ ��� ������ ��������� ����� ��� ������������������ ������������, ��������������� ��� ����������� ��������� ����� ,� ����� ��������������� ,���������� �� ����������� ��������� ������ ������ ����������.",
		},
		-- Crane
		armca={
			description="�����̣�-���������, ������ �� �������� 4 m/s",
			helptext="���� (Crane) ����� ������ ������ ������ �����, �� �� ����� ������ ��� ���. ���� � ���� ������������ ����� �������� ������������� �� ��������� � ������� �����������, �� ����� ������� � ��������������� ������ � ����������� �������� ���������� �� ����, ��� ���� ��������� ����������. ��������� ����� �����������, �� �������� �������� ��� ����������� �������� � ������ ������ �����.",
		},
    }
}
