state("fceux")
{
    ushort completeLevel:   0x3B1388, 0x00;
    byte startGame:         0x3B1388, 0x03;
    byte level:             0x3B1388, 0x63;
    int bonus:              0x3B1388, 0x340;
}

state("nestopia")
{
    ushort completeLevel:   "nestopia.exe", 0x1B2BCC, 0x00, 0x08, 0x0C, 0x0C, 0x68;
    byte startGame:         "nestopia.exe", 0x1B2BCC, 0x00, 0x08, 0x0C, 0x0C, 0x6B;
    byte level:             "nestopia.exe", 0x1B2BCC, 0x00, 0x08, 0x0C, 0x0C, 0xCB;
    int bonus:              "nestopia.exe", 0x1B2BCC, 0x00, 0x08, 0x0C, 0x0C, 0x3A8;
}

state("mednafen")
{
    ushort completeLevel:   "mednafen.exe", 0xBE1CE0;
    byte startGame:         "mednafen.exe", 0xBE1CE3;
    byte level:             "mednafen.exe", 0xBE1D43;
    int bonus:              "mednafen.exe", 0xBE2020;
}

state("punes64")
{
    ushort completeLevel:   0x13F1700;
    byte startGame:         0x13F1703;
    byte level:             0x13F1763;
    int bonus:              0x13F1A40;
}

state("nintendulator")
{
    ushort completeLevel:   0x5C0C8;
    byte startGame:         0x5C0CB;
    byte level:             0x5C12B;
    int bonus:              0x5C408;
}

state("mesen")
{
    ushort completeLevel:   "MesenCore.dll", 0x4311838, 0x118, 0xB8, 0x90, 0x1D8, 0x08, 0x00;
    byte startGame:         "MesenCore.dll", 0x4311838, 0x118, 0xB8, 0x90, 0x1D8, 0x08, 0x03;
    byte level:             "MesenCore.dll", 0x4311838, 0x118, 0xB8, 0x90, 0x1D8, 0x08, 0x63;
    int bonus:              "MesenCore.dll", 0x4311838, 0x118, 0xB8, 0x90, 0x1D8, 0x08, 0x340;
}

start
{
    return old.startGame == 0x00 && current.startGame == 0x40;
}

split
{
    if (current.level < 5)
    {
        return current.bonus == 0 && old.completeLevel != 0x0208 && current.completeLevel == 0x0208;
    }
    else
    {
        return old.completeLevel != 0x0108 && current.completeLevel == 0x0108;
    }
}

reset
{
    return old.startGame != 0x00 && current.startGame == 0x00;
}