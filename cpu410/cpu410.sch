<?xml version="1.0" encoding="UTF-8"?>
<drawing version="7">
    <attr value="spartan3e" name="DeviceFamilyName">
        <trait delete="all:0" />
        <trait editname="all:0" />
        <trait edittrait="all:0" />
    </attr>
    <netlist>
        <signal name="XLXN_1(15:0)" />
        <signal name="XLXN_2(15:0)" />
        <signal name="XLXN_3(15:0)" />
        <blockdef name="cmp8k">
            <timestamp>2016-11-21T5:45:26</timestamp>
            <rect width="256" x="64" y="-64" height="64" />
            <rect width="64" x="0" y="-44" height="24" />
            <line x2="0" y1="-32" y2="-32" x1="64" />
            <line x2="384" y1="-32" y2="-32" x1="320" />
        </blockdef>
        <blockdef name="mux4">
            <timestamp>2016-11-21T10:24:12</timestamp>
            <rect width="256" x="64" y="-320" height="320" />
            <rect width="64" x="0" y="-300" height="24" />
            <line x2="0" y1="-288" y2="-288" x1="64" />
            <rect width="64" x="0" y="-236" height="24" />
            <line x2="0" y1="-224" y2="-224" x1="64" />
            <rect width="64" x="0" y="-172" height="24" />
            <line x2="0" y1="-160" y2="-160" x1="64" />
            <rect width="64" x="0" y="-108" height="24" />
            <line x2="0" y1="-96" y2="-96" x1="64" />
            <rect width="64" x="0" y="-44" height="24" />
            <line x2="0" y1="-32" y2="-32" x1="64" />
            <rect width="64" x="320" y="-300" height="24" />
            <line x2="384" y1="-288" y2="-288" x1="320" />
        </blockdef>
        <blockdef name="mux2">
            <timestamp>2016-11-21T10:24:1</timestamp>
            <rect width="256" x="64" y="-192" height="192" />
            <line x2="0" y1="-160" y2="-160" x1="64" />
            <rect width="64" x="0" y="-108" height="24" />
            <line x2="0" y1="-96" y2="-96" x1="64" />
            <rect width="64" x="0" y="-44" height="24" />
            <line x2="0" y1="-32" y2="-32" x1="64" />
            <rect width="64" x="320" y="-172" height="24" />
            <line x2="384" y1="-160" y2="-160" x1="320" />
        </blockdef>
        <block symbolname="cmp8k" name="XLXI_1">
            <blockpin signalname="XLXN_2(15:0)" name="data_in(15:0)" />
            <blockpin name="res" />
        </block>
        <block symbolname="mux4" name="XLXI_3">
            <blockpin name="data1(15:0)" />
            <blockpin signalname="XLXN_1(15:0)" name="data2(15:0)" />
            <blockpin name="data3(15:0)" />
            <blockpin signalname="XLXN_3(15:0)" name="data4(15:0)" />
            <blockpin name="choose(1:0)" />
            <blockpin signalname="XLXN_2(15:0)" name="outdata(15:0)" />
        </block>
        <block symbolname="mux2" name="XLXI_4">
            <blockpin signalname="XLXN_1(15:0)" name="choose" />
            <blockpin name="data1(15:0)" />
            <blockpin name="data2(15:0)" />
            <blockpin signalname="XLXN_3(15:0)" name="outdata(15:0)" />
        </block>
    </netlist>
    <sheet sheetnum="1" width="3520" height="2720">
        <instance x="1744" y="1344" name="XLXI_1" orien="R0">
        </instance>
        <instance x="1008" y="1568" name="XLXI_3" orien="R0">
        </instance>
        <instance x="1168" y="1984" name="XLXI_4" orien="R0">
        </instance>
        <branch name="XLXN_1(15:0)">
            <wire x2="1008" y1="1344" y2="1344" x1="992" />
            <wire x2="992" y1="1344" y2="1824" x1="992" />
            <wire x2="1168" y1="1824" y2="1824" x1="992" />
        </branch>
        <branch name="XLXN_2(15:0)">
            <wire x2="1568" y1="1280" y2="1280" x1="1392" />
            <wire x2="1568" y1="1280" y2="1312" x1="1568" />
            <wire x2="1744" y1="1312" y2="1312" x1="1568" />
        </branch>
        <branch name="XLXN_3(15:0)">
            <wire x2="1008" y1="1472" y2="1472" x1="928" />
            <wire x2="928" y1="1472" y2="1648" x1="928" />
            <wire x2="1616" y1="1648" y2="1648" x1="928" />
            <wire x2="1616" y1="1648" y2="1824" x1="1616" />
            <wire x2="1616" y1="1824" y2="1824" x1="1552" />
        </branch>
    </sheet>
</drawing>