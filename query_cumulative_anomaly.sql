SELECT art.level_1_code                                                                    AS KODE_PROV,
       art.level_1_name                                                                    AS PROV,
       art.level_2_code                                                                    AS KODE_KAB,
       art.level_2_name                                                                    AS KAB,
       art.level_3_code                                                                    AS KODE_KEC,
       art.level_3_name                                                                    AS KEC,
       art.level_4_code                                                                    AS KODE_DESA,
       art.level_4_name                                                                    AS DESA,
       art.level_5_code                                                                    AS BS,
       art.level_6_code                                                                    AS NKS,
       r_root.no_dsrt                                                                      AS DSRT,
       art.index1                                                                          AS NO_ART,
       art.b4k2                                                                            AS NAMA_ART,
       CONCAT(
        -- Anomali 1
        CASE WHEN (
            art.b4k10 >= 5
            AND r53.b5r14a_value IS NOT NULL
            AND (r53.b5r14a_value = 59111 OR r53.b5r14a_value = 59121 OR r53.b5r14a_value = 59131 OR r53.b5r14a_value = 60101 OR
                r53.b5r14a_value = 60201 OR r53.b5r14a_value = 63911 OR r53.b5r14a_value = 78411 OR r53.b5r14a_value = 78419 OR
                (r53.b5r14a_value >= 84111 AND r53.b5r14a_value <= 84300) OR r53.b5r14a_value = 85111 OR
                r53.b5r14a_value = 85112 OR r53.b5r14a_value = 85131 OR r53.b5r14a_value = 85210 OR r53.b5r14a_value = 85230 OR
                r53.b5r14a_value = 85311 OR r53.b5r14a_value = 85312 OR r53.b5r14a_value = 85331 OR r53.b5r14a_value = 85430 OR
                r53.b5r14a_value = 86101 OR r53.b5r14a_value = 86102 OR r53.b5r14a_value = 86104 OR r53.b5r14a_value = 87301 OR
                r53.b5r14a_value = 87901 OR r53.b5r14a_value = 88101 OR r53.b5r14a_value = 88991 OR r53.b5r14a_value = 91011 OR
                r53.b5r14a_value = 91021 OR r53.b5r14a_value = 91023)
            AND r53.b5r13a_value IS NOT NULL
            AND r53.b5r20_value IS NOT NULL
            AND r53.b5r25a_value IS NOT NULL
            AND (r53.b5r13a_value <> 4 OR r53.b5r20_value <> 1 OR r53.b5r25a_value <> 1)
        ) THEN 'A1,' END,
        -- Anomali 2
        CASE WHEN (
            art.b4k10 >= 5
            AND r53.b5r13a_value = 4
            AND r53.b5r20_value = 1
            AND r53.b5r25a_value = 1
            AND r53.b5r14a_value IS NOT NULL
            AND (r53.b5r14a_value >= 84111 AND r53.b5r14a_value <= 84300)
            AND (r53.b5r14b_value = 1111 OR r53.b5r14b_value = 1112 OR r53.b5r14b_value = 2612)
            AND r51.b5r6a_value IS NOT NULL
            AND r51.b5r6a_value < 8
        ) THEN 'A2,' END,
        -- Anomali 3
        CASE WHEN (
            art.b4k10 >= 5
            AND (r53.b5r14b_value = 2211 OR r53.b5r14b_value = 2212 OR r53.b5r14b_value = 2250 OR r53.b5r14b_value = 2261 OR
                r53.b5r14b_value = 2262 OR r53.b5r14b_value = 2310 OR r53.b5r14b_value = 2330 OR r53.b5r14b_value = 2341 OR
                r53.b5r14b_value = 2411 OR r53.b5r14b_value = 2611 OR r53.b5r14b_value = 2631 OR r53.b5r14b_value = 2632 OR
                r53.b5r14b_value = 2634)
            AND r51.b5r6a_value IS NOT NULL
            AND r51.b5r6a_value < 8
        ) THEN 'A3,' END,
        -- Anomali 4
        CASE WHEN (
            art.b4k10 >= 5
            AND (r53.b5r14b_value = 3351 OR r53.b5r14b_value = 3352 OR r53.b5r14b_value = 3353 OR r53.b5r14b_value = 3354 OR
                r53.b5r14b_value = 3359 OR r53.b5r14b_value = 5411 OR r53.b5r14b_value = 5413 OR r53.b5r14b_value = 8311)
            AND ((r53.b5r13a_value IS NOT NULL AND r53.b5r13a_value <> 4) OR
                (r53.b5r20_value IS NOT NULL AND r53.b5r20_value <> 1) OR
                (r53.b5r14a_value IS NOT NULL AND (r53.b5r14a_value < 84111 OR r53.b5r14a_value > 84300)) OR
                (r51.b5r6a_value IS NOT NULL AND r51.b5r6a_value < 8))
        ) THEN 'A4,' END,
        -- Anomali 5
        CASE WHEN (
            art.b4k10 >= 5
            AND r53.b5r14a_value IS NOT NULL
            AND r53.b5r14a_value >= 05100
            AND r53.b5r16a_value IS NOT NULL
            AND r53.b5r16a_value < 5
        ) THEN 'A5,' END,
        -- Anomali 6
        CASE WHEN (
            art.b4k10 >= 5
            AND r53.b5r14a_value IS NOT NULL
            AND (r53.b5r14a_value >= 01111 AND r53.b5r14a_value <= 03279)
            AND r53.b5r16a_value = 5
        ) THEN 'A6,' END,
        -- Anomali 7
        CASE WHEN (
            art.b4k10 >= 5
            AND r53.b5r14a_value IS NOT NULL
            AND (r53.b5r14a_value >= 01111 AND r53.b5r14a_value <= 01302)
            AND r53.b5r16a_value IS NOT NULL
            AND r53.b5r16a_value > 2
        ) THEN 'A7,' END,
        -- Anomali 8
        CASE WHEN (
            art.b4k10 >= 5
            AND (r53.b5r14a_value = 1111 OR r53.b5r14a_value = 1112 OR r53.b5r14a_value = 1113 OR r53.b5r14a_value = 1121 OR
                r53.b5r14a_value = 1122 OR r53.b5r14a_value = 1135)
            AND r53.b5r16a_value IS NOT NULL
            AND r53.b5r16a_value <> 1
        ) THEN 'A8,' END,
        -- Anomali 9
        CASE WHEN (
            art.b4k10 >= 5
            AND r53.b5r14a_value IS NOT NULL
            AND (r53.b5r14a_value >= 02111 AND r53.b5r14a_value <= 02409)
            AND r53.b5r16a_value IS NOT NULL
            AND r53.b5r16a_value <> 2
        ) THEN 'A9,' END,
        -- Anomali 10
        CASE WHEN (
            art.b4k10 >= 5
            AND r53.b5r14a_value IS NOT NULL
            AND (r53.b5r14a_value >= 01411 AND r53.b5r14a_value <= 01499)
            AND r53.b5r16a_value IS NOT NULL
            AND r53.b5r16a_value <> 3
        ) THEN 'A10,' END,
        -- Anomali 11
        CASE WHEN (
            art.b4k10 >= 5
            AND r53.b5r14a_value IS NOT NULL
            AND (r53.b5r14a_value >= 03111 AND r53.b5r14a_value <= 03279)
            AND r53.b5r16a_value IS NOT NULL
            AND r53.b5r16a_value <> 4
        ) THEN 'A11,' END,
        -- Anomali 12
        CASE WHEN (
            art.b4k10 >= 5
            AND r51.b5r6a_value = 4
            AND r51.b5r6b_j_kd_value IS NOT NULL
            AND (r51.b5r6b_j_kd_value > 4 AND r51.b5r6b_j_kd_value < 998)
        ) THEN 'A12,' END,
        -- Anomali 13
        CASE WHEN (
            art.b4k10 >= 5
            AND (r51.b5r6a_value = 5 OR r51.b5r6a_value = 6)
            AND r51.b5r6b_j_kd_value IS NOT NULL
            AND r51.b5r6b_j_kd_value > 52 
            AND r51.b5r6b_j_kd_value < 998
        ) THEN 'A13,' END,
        -- Anomali 14
        CASE WHEN (
            art.b4k10 >= 5
            AND r51.b5r6a_value = 7
            AND r51.b5r6b_p_value = 4
            AND r51.b5r6b_j_kd_value IS NOT NULL
            AND (r51.b5r6b_j_kd_value <> 999)
        ) THEN 'A14,' END,
        -- Anomali 15
        CASE WHEN (
            art.b4k10 >= 5
            AND r51.b5r6a_value = 8
            AND r51.b5r6b_p_value = 4
            AND r51.b5r6b_j_kd_value IS NOT NULL
            AND (r51.b5r6b_j_kd_value <> 999)
        ) THEN 'A15,' END,
        -- Anomali 16
        CASE WHEN (
            art.b4k10 >= 5
            AND (r51.b5r6a_value >= 9 AND r51.b5r6a_value <= 12)
            AND r51.b5r6b_p_value = 4
            AND r51.b5r6b_j_kd_value IS NOT NULL
            AND (r51.b5r6b_j_kd_value <> 999)
        ) THEN 'A16,' END,
        -- Anomali 17
        CASE WHEN (
            art.b4k10 >= 5
            AND ((r53.b5r14a_value >= 64110 AND r53.b5r14a_value <= 64132) OR
                (r53.b5r14a_value >= 84111 AND r53.b5r14a_value <= 84234) OR r53.b5r14a_value = 99000)
            AND r51.b5r6a_value = 1
        ) THEN 'A17,' END,
        -- Anomali 18
        CASE WHEN (
            art.b4k10 >= 5
            AND (r53.b5r14b_value = 111 OR r53.b5r14b_value = 112 OR r53.b5r14b_value = 113 OR r53.b5r14b_value = 114 OR
                r53.b5r14b_value = 115)
            AND r51.b5r6a_value < 4
        ) THEN 'A18,' END,
        -- Anomali 19
        CASE WHEN (
            art.b4k10 >= 5
            AND (r53.b5r14b_value = 211 OR r53.b5r14b_value = 212 OR r53.b5r14b_value = 213 OR r53.b5r14b_value = 214 OR
                r53.b5r14b_value = 215 OR r53.b5r14b_value = 311 OR r53.b5r14b_value = 312 OR r53.b5r14b_value = 313 OR
                r53.b5r14b_value = 314 OR r53.b5r14b_value = 315)
            AND r51.b5r6a_value < 3
        ) THEN 'A19,' END,
        -- Anomali 20
        CASE WHEN (
            art.b4k10 >= 5
            AND r53.b5r14b_value IS NOT NULL
            AND ((r53.b5r14b_value >= 1111 AND r53.b5r14b_value <= 1112) OR
                (r53.b5r14b_value >= 2111 AND r53.b5r14b_value <= 2356) OR
                (r53.b5r14b_value >= 2411 AND r53.b5r14b_value <= 2643))
            AND r51.b5r6a_value < 4
        ) THEN 'A20,' END,
        -- Anomali 21
        CASE WHEN (
            art.b4k10 >= 5
            AND r53.b5r14b_value IS NOT NULL
            AND (r53.b5r14b_value >= 1113 AND r53.b5r14b_value <= 1431)
            AND r51.b5r6a_value < 2
        ) THEN 'A21,' END,
        -- Anomali 22
        CASE WHEN (
            art.b4k10 >= 5
            AND (r53.b5r14b_value = 111 OR r53.b5r14b_value = 112 OR r53.b5r14b_value = 113 OR r53.b5r14b_value = 114 OR
                r53.b5r14b_value = 115)
            AND art.b4k10 < 18
        ) THEN 'A22,' END,
        -- Anomali 23
        CASE WHEN (
            art.b4k10 >= 5
            AND (r53.b5r14b_value = 211 OR r53.b5r14b_value = 212 OR r53.b5r14b_value = 213 OR r53.b5r14b_value = 214 OR
                r53.b5r14b_value = 215 OR r53.b5r14b_value = 311 OR r53.b5r14b_value = 312 OR r53.b5r14b_value = 313 OR
                r53.b5r14b_value = 314 OR r53.b5r14b_value = 315)
            AND art.b4k10 < 16
        ) THEN 'A23,' END,
        -- Anomali 24
        CASE WHEN (
            art.b4k10 >= 5
            AND ((r53.b5r14b_value >= 1111 AND r53.b5r14b_value <= 1431) OR
                (r53.b5r14b_value >= 2111 AND r53.b5r14b_value <= 2356) OR
                (r53.b5r14b_value >= 2411 AND r53.b5r14b_value <= 2643) OR
                (r53.b5r14b_value >= 3111 AND r53.b5r14b_value <= 3413))
            AND art.b4k10 < 15
        ) THEN 'A24,' END,
        -- Anomali 25
        CASE WHEN (
            art.b4k10 >= 5
            AND r53.b5r14b_value IS NOT NULL
            AND (r53.b5r14b_value = 1311 OR r53.b5r14b_value = 1312 OR r53.b5r14b_value = 3142 OR r53.b5r14b_value = 3143 OR
                (r53.b5r14b_value >= 6111 AND r53.b5r14b_value <= 6340) OR
                (r53.b5r14b_value >= 9211 AND r53.b5r14b_value <= 9216))
            AND r53.b5r14a_value IS NOT NULL
            AND (r53.b5r14a_value < 1111 OR r53.b5r14a_value > 3279)
        ) THEN 'A25,' END,
        -- Anomali 26
        CASE WHEN (
            art.b4k10 >= 5
            AND r53.b5r14a_value IS NOT NULL
            AND ((r53.b5r14b_value >= 111 AND r53.b5r14b_value <= 315) AND (r53.b5r14a_value < 84221 OR r53.b5r14a_value > 84233))
        ) THEN 'A26,' END,
        -- Anomali 27
        CASE WHEN (
            art.b4k10 >= 5
            AND r53.b5r14a_value IS NOT NULL
            AND r53.b5r14b_value = 2320
            AND (r53.b5r14a_value < 85230 OR (r53.b5r14a_value > 85230 AND r53.b5r14a_value < 85240) OR
                (r53.b5r14a_value > 85240 AND r53.b5r14a_value < 85311) OR
                (r53.b5r14a_value > 85312 AND r53.b5r14a_value < 85321) OR r53.b5r14a_value > 85322)
        ) THEN 'A27,' END,
        -- Anomali 28
        CASE WHEN (
            art.b4k10 >= 5
            AND r53.b5r14b_value IS NOT NULL
            AND r53.b5r14b_value = 2330
            AND r53.b5r14a_value IS NOT NULL
            AND (r53.b5r14a_value < 85112 OR (r53.b5r14a_value > 85112 AND r53.b5r14a_value < 85122) OR
                (r53.b5r14a_value > 85122 AND r53.b5r14a_value < 85210) OR
                (r53.b5r14a_value > 85210 AND r53.b5r14a_value < 85220) OR
                (r53.b5r14a_value > 85220 AND r53.b5r14a_value < 85230) OR
                (r53.b5r14a_value > 85230 AND r53.b5r14a_value < 85240) OR
                (r53.b5r14a_value > 85240 AND r53.b5r14a_value < 85251) OR
                (r53.b5r14a_value > 85251 AND r53.b5r14a_value < 85252) OR
                (r53.b5r14a_value > 85252 AND r53.b5r14a_value < 85270) OR r53.b5r14a_value > 85270)
        ) THEN 'A28,' END,
        -- Anomali 29
        CASE WHEN (
            art.b4k10 >= 5
            AND r53.b5r13a_value IS NOT NULL
            AND r53.b5r13a_value = 5
            AND r53.b5r14a_value IS NOT NULL
            AND r53.b5r14a_value >= 5100
        ) THEN 'A29,' END,
        -- Anomali 30
        CASE WHEN (
            art.b4k10 >= 5
            AND r53.b5r13a_value IS NOT NULL
            AND r53.b5r13a_value = 6
            AND r53.b5r14a_value IS NOT NULL
            AND ((r53.b5r14a_value >= 1111 AND r53.b5r14a_value <= 3279) OR
                (r53.b5r14a_value >= 84111 AND r53.b5r14a_value <= 84300))
        ) THEN 'A30,' END,
        -- Anomali 31
        CASE WHEN (
            art.b4k10 >= 5
            AND r53.b5r14a_value IS NOT NULL
            AND (r53.b5r14a_value >= 84111 AND r53.b5r14a_value <= 84300)
            AND r53.b5r13a_value IS NOT NULL
            AND r53.b5r13a_value <> 4
        ) THEN 'A31,' END,
        -- Anomali 32
        CASE WHEN (
            art.b4k10 >= 5
            AND r53.b5r14b_value = 2612
            AND r53.b5r14a_value IS NOT NULL
            AND r53.b5r14a_value <> 84233
        ) THEN 'A32,' END,
        -- Anomali 33
        CASE WHEN (
            art.b4k10 >= 5
            AND r53.b5r14a_value IS NOT NULL
            AND (r53.b5r14a_value >= 84111 AND r53.b5r14a_value <= 84300)
            AND r53.b5r13a_value IS NOT NULL
            AND r53.b5r13a_value = 4
            AND art.b4k5_value IS NOT NULL
            AND art.b4k5_value = 2
        ) THEN 'A33,' END,
        -- Anomali 34
        CASE WHEN (
            art.b4k10 >= 5
            AND r53.b5r13a_value = 4
            AND r53.b5r14a_value IS NOT NULL
            AND (r53.b5r14a_value >= 84111 AND r53.b5r14a_value <= 84300)
            AND r53.b5r23a1_value <> 1
        ) THEN 'A34,' END,
        -- Anomali 35
        CASE WHEN (
            art.b4k10 >= 5
            AND r53.b5r14a_value IS NOT NULL
            AND (r53.b5r14a_value >= 84111 AND r53.b5r14a_value <= 84300)
            AND r53.b5r13a_value IS NOT NULL
            AND r53.b5r13a_value = 4
            AND r53.b5r23b_value IS NOT NULL
            AND r53.b5r23b_value <> 1
        ) THEN 'A35,' END,
        -- Anomali 36
        CASE WHEN (
            art.b4k10 >= 5
            AND ((r54.b5r32a_value >= 64110 AND r54.b5r32a_value <= 64132) OR
                (r54.b5r32a_value >= 84111 AND r54.b5r32a_value <= 84234) OR r54.b5r32a_value = 99000)
            AND r51.b5r6a_value = 1
        ) THEN 'A36,' END,
        -- Anomali 37
        CASE WHEN (
            art.b4k10 >= 5
            AND (r54.b5r32b_value = 111 OR r54.b5r32b_value = 112 OR r54.b5r32b_value = 113 OR r54.b5r32b_value = 114 OR
                r54.b5r32b_value = 115)
            AND r51.b5r6a_value < 4
        ) THEN 'A37,' END,
        -- Anomali 38
        CASE WHEN (
            art.b4k10 >= 5
            AND (r54.b5r32b_value = 211 OR r54.b5r32b_value = 212 OR r54.b5r32b_value = 213 OR r54.b5r32b_value = 214 OR
                r54.b5r32b_value = 215 OR r54.b5r32b_value = 311 OR r54.b5r32b_value = 312 OR r54.b5r32b_value = 313 OR
                r54.b5r32b_value = 314 OR r54.b5r32b_value = 315)
            AND r51.b5r6a_value < 3
        ) THEN 'A38,' END,
        -- Anomali 39
        CASE WHEN (
            art.b4k10 >= 5
            AND r54.b5r32b_value IS NOT NULL
            AND ((r54.b5r32b_value >= 1111 AND r54.b5r32b_value <= 1112) OR
                (r54.b5r32b_value >= 2111 AND r54.b5r32b_value <= 2356) OR
                (r54.b5r32b_value >= 2411 AND r54.b5r32b_value <= 2643))
            AND r51.b5r6a_value < 4
        ) THEN 'A39,' END,
        -- Anomali 40
        CASE WHEN (
            art.b4k10 >= 5
            AND r54.b5r32b_value IS NOT NULL
            AND (r54.b5r32b_value >= 1113 AND r54.b5r32b_value <= 1431)
            AND r51.b5r6a_value < 2
        ) THEN 'A40,' END,
        -- Anomali 41
        CASE WHEN (
            art.b4k10 >= 5
            AND (r54.b5r32b_value = 111 OR r54.b5r32b_value = 112 OR r54.b5r32b_value = 113 OR r54.b5r32b_value = 114 OR
                r54.b5r32b_value = 115)
            AND art.b4k10 < 18
        ) THEN 'A41,' END,
        -- Anomali 42
        CASE WHEN (
            art.b4k10 >= 5
            AND (r54.b5r32b_value = 211 OR r54.b5r32b_value = 212 OR r54.b5r32b_value = 213 OR r54.b5r32b_value = 214 OR
                r54.b5r32b_value = 215 OR r54.b5r32b_value = 311 OR r54.b5r32b_value = 312 OR r54.b5r32b_value = 313 OR
                r54.b5r32b_value = 314 OR r54.b5r32b_value = 315)
            AND art.b4k10 < 16
        ) THEN 'A42,' END,
        -- Anomali 43
        CASE WHEN (
            art.b4k10 >= 5
            AND ((r54.b5r32b_value >= 1111 AND r54.b5r32b_value <= 1431) OR
                (r54.b5r32b_value >= 2111 AND r54.b5r32b_value <= 2356) OR
                (r54.b5r32b_value >= 2411 AND r54.b5r32b_value <= 2643) OR
                (r54.b5r32b_value >= 3111 AND r54.b5r32b_value <= 3413))
            AND art.b4k10 < 15
        ) THEN 'A43,' END,
        -- Anomali 44
        CASE WHEN (
            art.b4k10 >= 5
            AND r54.b5r32b_value IS NOT NULL
            AND (r54.b5r32b_value = 1311 OR r54.b5r32b_value = 1312 OR r54.b5r32b_value = 3142 OR r54.b5r32b_value = 3143 OR
                (r54.b5r32b_value >= 6111 AND r54.b5r32b_value <= 6340) OR
                (r54.b5r32b_value >= 9211 AND r54.b5r32b_value <= 9216))
            AND r54.b5r32a_value IS NOT NULL
            AND (r54.b5r32a_value < 1111 OR r54.b5r32a_value > 3279)
        ) THEN 'A44,' END,
        -- Anomali 45
        CASE WHEN (
            art.b4k10 >= 5
            AND r54.b5r32a_value IS NOT NULL
            AND ((r54.b5r32b_value >= 111 AND r54.b5r32b_value <= 315) AND (r54.b5r32a_value < 84220 OR r54.b5r32a_value > 84233))
        ) THEN 'A45,' END,
        -- Anomali 46
        CASE WHEN (
            art.b4k10 >= 5
            AND r54.b5r32a_value IS NOT NULL
            AND r54.b5r32b_value = 2320
            AND (r54.b5r32a_value < 85230 OR (r54.b5r32a_value > 85230 AND r54.b5r32a_value < 85240) OR
                (r54.b5r32a_value > 85240 AND r54.b5r32a_value < 85311) OR
                (r54.b5r32a_value > 85312 AND r54.b5r32a_value < 85321) OR r54.b5r32a_value > 85322)
        ) THEN 'A46,' END,
        -- Anomali 47
        CASE WHEN (
            art.b4k10 >= 5
            AND r54.b5r32b_value IS NOT NULL
            AND r54.b5r32b_value = 2330
            AND r54.b5r32a_value IS NOT NULL
            AND (r54.b5r32a_value < 85112 OR (r54.b5r32a_value > 85112 AND r54.b5r32a_value < 85122) OR
                (r54.b5r32a_value > 85122 AND r54.b5r32a_value < 85210) OR
                (r54.b5r32a_value > 85210 AND r54.b5r32a_value < 85220) OR
                (r54.b5r32a_value > 85220 AND r54.b5r32a_value < 85230) OR
                (r54.b5r32a_value > 85230 AND r54.b5r32a_value < 85240) OR
                (r54.b5r32a_value > 85240 AND r54.b5r32a_value < 85251) OR
                (r54.b5r32a_value > 85251 AND r54.b5r32a_value < 85252) OR
                (r54.b5r32a_value > 85252 AND r54.b5r32a_value < 85270) OR r54.b5r32a_value > 85270)
        ) THEN 'A47,' END,
        -- Anomali 48
        CASE WHEN (
            art.b4k10 >= 5
            AND r54.b5r31a_value IS NOT NULL
            AND r54.b5r31a_value = 5
            AND r54.b5r32a_value IS NOT NULL
            AND r54.b5r32a_value >= 5100
        ) THEN 'A48,' END,
        -- Anomali 49
        CASE WHEN (
            art.b4k10 >= 5
            AND r54.b5r31a_value IS NOT NULL
            AND r54.b5r31a_value = 6
            AND r54.b5r32a_value IS NOT NULL
            AND ((r54.b5r32a_value >= 1111 AND r54.b5r32a_value <= 3279) OR
                (r54.b5r32a_value >= 84111 AND r54.b5r32a_value <= 84300))
        ) THEN 'A49,' END,
        -- Anomali 50
        CASE WHEN (
            art.b4k10 >= 5
            AND r54.b5r32a_value IS NOT NULL
            AND (r54.b5r32a_value >= 84111 AND r54.b5r32a_value <= 84300)
            AND r53.b5r13a_value IS NOT NULL
            AND r54.b5r31a_value <> 4
        )  THEN 'A50,' END,
        -- Anomali 51
        CASE WHEN (
            art.b4k10 >= 5
            AND r54.b5r32b_value = 2612
            AND r54.b5r32a_value IS NOT NULL
            AND r54.b5r32a_value <> 84233
        ) THEN 'A51,' END,
        -- Anomali 52
        CASE WHEN (
            art.b4k10 >= 5
            AND r54.b5r32a_value IS NOT NULL
            AND (r54.b5r32a_value >= 84111 AND r54.b5r32a_value <= 84300)
            AND r53.b5r13a_value IS NOT NULL
            AND r54.b5r31a_value = 4
            AND art.b4k5_value IS NOT NULL
            AND art.b4k5_value = 2
        ) THEN 'A52,' END,
        -- Anomali 53
        CASE WHEN (
            art.b4k10 >= 5
            AND ((r57.b5r47a_value >= 64110 AND r57.b5r47a_value <= 64132) OR
                (r57.b5r47a_value >= 84111 AND r57.b5r47a_value <= 84234) OR r57.b5r47a_value = 99000)
            AND r51.b5r6a_value = 1
        ) THEN 'A53,' END,
        -- Anomali 54
        CASE WHEN (
            art.b4k10 >= 5
            AND (r57.b5r47b_value = 111 OR r57.b5r47b_value = 112 OR r57.b5r47b_value = 113 OR r57.b5r47b_value = 114 OR
                r57.b5r47b_value = 115)
            AND r51.b5r6a_value < 4
        ) THEN 'A54,' END,
        -- Anomali 55
        CASE WHEN (
            art.b4k10 >= 5
            AND (r53.b5r14b_value = 211 OR r57.b5r47b_value = 212 OR r57.b5r47b_value = 213 OR r57.b5r47b_value = 214 OR
                r57.b5r47b_value = 215 OR r57.b5r47b_value = 311 OR r57.b5r47b_value = 312 OR r57.b5r47b_value = 313 OR
                r57.b5r47b_value = 314 OR r57.b5r47b_value = 315)
            AND r51.b5r6a_value < 3
        ) THEN 'A55,' END,
        -- Anomali 56
        CASE WHEN (
            art.b4k10 >= 5
            AND r57.b5r47b_value IS NOT NULL
            AND ((r57.b5r47b_value >= 1111 AND r57.b5r47b_value <= 1112) OR
                (r57.b5r47b_value >= 2111 AND r57.b5r47b_value <= 2356) OR
                (r57.b5r47b_value >= 2411 AND r57.b5r47b_value <= 2643))
            AND r51.b5r6a_value < 4
        ) THEN 'A56,' END,
        -- Anomali 57
        CASE WHEN (
            art.b4k10 >= 5
            AND r57.b5r47b_value IS NOT NULL
            AND (r57.b5r47b_value >= 1113 AND r57.b5r47b_value <= 1431)
            AND r51.b5r6a_value < 2
        ) THEN 'A57,' END,
        -- Anomali 58
        CASE WHEN (
            art.b4k10 >= 5
            AND (r57.b5r47b_value = 111 OR r57.b5r47b_value = 112 OR r57.b5r47b_value = 113 OR r57.b5r47b_value = 114 OR
                r57.b5r47b_value = 115)
            AND art.b4k10 < 18
        ) THEN 'A58,' END,
        -- Anomali 59
        CASE WHEN (
            art.b4k10 >= 5
            AND (r53.b5r14b_value = 211 OR r57.b5r47b_value = 212 OR r57.b5r47b_value = 213 OR r57.b5r47b_value = 214 OR
                r57.b5r47b_value = 215 OR r57.b5r47b_value = 311 OR r57.b5r47b_value = 312 OR r57.b5r47b_value = 313 OR
                r57.b5r47b_value = 314 OR r57.b5r47b_value = 315)
            AND art.b4k10 < 16
        ) THEN 'A59,' END,
        -- Anomali 60
        CASE WHEN (
            art.b4k10 >= 5
            AND ((r57.b5r47b_value >= 1111 AND r57.b5r47b_value <= 1431) OR
                (r57.b5r47b_value >= 2111 AND r57.b5r47b_value <= 2356) OR
                (r57.b5r47b_value >= 2411 AND r57.b5r47b_value <= 2643) OR
                (r57.b5r47b_value >= 3111 AND r57.b5r47b_value <= 3413))
            AND art.b4k10 < 15
        ) THEN 'A60,' END,
        -- Anomali 61
        CASE WHEN (
            art.b4k10 >= 5
            AND r57.b5r47b_value IS NOT NULL
            AND (r57.b5r47b_value = 1311 OR r57.b5r47b_value = 1312 OR r57.b5r47b_value = 3142 OR r57.b5r47b_value = 3143 OR
                (r57.b5r47b_value >= 6111 AND r57.b5r47b_value <= 6340) OR
                (r57.b5r47b_value >= 9211 AND r57.b5r47b_value <= 9216))
            AND r57.b5r47a_value IS NOT NULL
            AND (r57.b5r47a_value < 1111 OR r57.b5r47a_value > 3279)
        ) THEN 'A61,' END,
        -- Anomali 62
        CASE WHEN (
            art.b4k10 >= 5
            AND r57.b5r47b_value IS NOT NULL
            AND ((r57.b5r47b_value >= 111 AND r57.b5r47b_value <= 315) AND r57.b5r47a_value IS NOT NULL AND
                (r57.b5r47a_value < 84220 OR r57.b5r47a_value > 84233))
        ) THEN 'A62,' END,
        -- Anomali 63
        CASE WHEN (
            art.b4k10 >= 5
            AND r57.b5r47a_value IS NOT NULL
            AND r57.b5r47b_value = 2320
            AND (r57.b5r47a_value < 85230 OR (r57.b5r47a_value > 85230 AND r57.b5r47a_value < 85240) OR
                (r57.b5r47a_value > 85240 AND r57.b5r47a_value < 85311) OR
                (r57.b5r47a_value > 85312 AND r57.b5r47a_value < 85321) OR r57.b5r47a_value > 85322)
        ) THEN 'A63,' END,
        -- Anomali 64
        CASE WHEN (
            art.b4k10 >= 5
            AND r57.b5r47b_value IS NOT NULL
            AND r57.b5r47b_value = 2330
            AND r57.b5r47a_value IS NOT NULL
            AND (r57.b5r47a_value < 85112 OR (r57.b5r47a_value > 85112 AND r57.b5r47a_value < 85122) OR
                (r57.b5r47a_value > 85122 AND r57.b5r47a_value < 85210) OR
                (r57.b5r47a_value > 85210 AND r57.b5r47a_value < 85220) OR
                (r57.b5r47a_value > 85220 AND r57.b5r47a_value < 85230) OR
                (r57.b5r47a_value > 85230 AND r57.b5r47a_value < 85240) OR
                (r57.b5r47a_value > 85240 AND r57.b5r47a_value < 85251) OR
                (r57.b5r47a_value > 85251 AND r57.b5r47a_value < 85252) OR
                (r57.b5r47a_value > 85252 AND r57.b5r47a_value < 85270) OR r57.b5r47a_value > 85270)
        ) THEN 'A64,' END,
        -- Anomali 65
        CASE WHEN (
            art.b4k10 >= 5
            AND r57.b5r46d_value IS NOT NULL
            AND r57.b5r46d_value = 5
            AND r57.b5r47a_value IS NOT NULL
            AND (r57.b5r47a_value < 1111 OR r57.b5r47a_value > 3279)
        ) THEN 'A65,' END,
        -- Anomali 66
        CASE WHEN (
            art.b4k10 >= 5
            AND r57.b5r46d_value IS NOT NULL
            AND r57.b5r46d_value = 6
            AND r57.b5r47a_value IS NOT NULL
            AND ((r57.b5r47a_value >= 1111 AND r57.b5r47a_value <= 3279) OR
                (r57.b5r47a_value >= 84111 AND r57.b5r47a_value <= 84300))
        ) THEN 'A66,' END,
        -- Anomali 67
        CASE WHEN (
            art.b4k10 >= 5
            AND r57.b5r47a_value IS NOT NULL
            AND (r57.b5r47a_value >= 84111 AND r57.b5r47a_value <= 84300)
            AND r57.b5r46d_value IS NOT NULL
            AND r57.b5r46d_value <> 4
        ) THEN 'A67,' END,
        -- Anomali 68
        CASE WHEN (
            art.b4k10 >= 5
            AND r57.b5r47b_value = 2612
            AND r57.b5r47a_value IS NOT NULL
            AND r57.b5r47a_value <> 84233
        ) THEN 'A68,' END,
        -- Anomali 69
        CASE WHEN (
            art.b4k10 >= 5
            AND (r51.b5r6a_value >= 4 AND r51.b5r6a_value <= 12)
            AND r51.b5r6b_j_kd_value IS NULL
            AND asg.assignment_status_id = 2
        ) THEN 'A69,' END,
        -- Anomali 70
        CASE WHEN (
            art.b4k10 >= 5
            AND r51.b5r6g_jml = 1
            AND (r51.b5r6g1_kd_value IS NULL)
            AND asg.assignment_status_id = 2
        ) THEN 'A70,' END,
        -- Anomali 71
        CASE WHEN (
            art.b4k10 >= 5
            AND r51.b5r6g_jml = 2
            AND (r51.b5r6g1_kd_value IS NULL)
            AND asg.assignment_status_id = 2
        ) THEN 'A71,' END,
        -- Anomali 72
        CASE WHEN (
            art.b4k10 >= 5
            AND r51.b5r6g_jml = 2
            AND (r51.b5r6g2_kd_value IS NULL)
            AND asg.assignment_status_id = 2
        ) THEN 'A72,' END,
        -- Anomali 73
        CASE WHEN (
            art.b4k10 >= 5
            AND r51.b5r6g_jml = 3
            AND (r51.b5r6g1_kd_value IS NULL)
            AND asg.assignment_status_id = 2
        ) THEN 'A73,' END,
        -- Anomali 74
        CASE WHEN (
            art.b4k10 >= 5
            AND r51.b5r6g_jml = 3
            AND (r51.b5r6g2_kd_value IS NULL)
            AND asg.assignment_status_id = 2
        ) THEN 'A74,' END,
        -- Anomali 75
        CASE WHEN (
            art.b4k10 >= 5
            AND r51.b5r6g_jml = 3
            AND (r51.b5r6g3_kd_value IS NULL)
            AND asg.assignment_status_id = 2
        ) THEN 'A75,' END,
        -- Anomali 76
        CASE WHEN (
            art.b4k10 >= 5
            AND b5r6g1_s.pair_value = 'A'
            AND r51.b5r6g1_kd_value IS NULL
        ) THEN 'A76,' END,
        -- Anomali 77
        CASE WHEN (
            art.b4k10 >= 5
            AND b5r6g1_s.pair_value = 'A'
            AND r51.b5r6g1_kd_value IS NULL
        ) THEN 'A77,' END,
        -- Anomali 78
        CASE WHEN (
            art.b4k10 >= 5
            AND b5r6g3_s.pair_value = 'A'
            AND r51.b5r6g3_kd_value IS NULL
        ) THEN 'A78,' END,
        -- Anomali 79
        CASE WHEN (
            art.b4k10 >= 5
            AND (r52.b5r9a_value = 1 OR r52.b5r9b_value = 1 OR r52.b5r9c_value = 1 OR r52.b5r10_value = 1)
            AND r53.b5r14a_value IS NULL
            AND asg.assignment_status_id = 2
        ) THEN 'A79,' END,
        -- Anomali 80
        CASE WHEN (
            art.b4k10 >= 5
            AND (r52.b5r9a_value = 1 OR r52.b5r9b_value = 1 OR r52.b5r9c_value = 1 OR r52.b5r10_value = 1)
            AND r53.b5r14b_value IS NULL
            AND asg.assignment_status_id = 2
        ) THEN 'A80,' END,
        -- Anomali 81
        CASE WHEN (
            art.b4k10 >= 5
            AND r53.b5r20_value = 1
            AND r54.b5r32a_value IS NULL
            AND asg.assignment_status_id = 2
        ) THEN 'A81,' END,
        -- Anomali 82
        CASE WHEN (
            art.b4k10>=5
            AND r53.b5r20_value=1
            AND r54.b5r32b_value IS NULL
            AND asg.assignment_status_id = 2
        ) THEN 'A82,' END,
        -- Anomali 83
        CASE WHEN (
            art.b4k10 >= 5
            AND r57.b5r45a_value = 1
            AND r57.b5r47a_value IS NULL
            AND asg.assignment_status_id = 2
        ) THEN 'A83,' END,
        -- Anomali 84
        CASE WHEN (
            art.b4k10 >= 5
            AND r57.b5r45a_value = 1
            AND r57.b5r47b_value IS NULL
            AND asg.assignment_status_id = 2
        ) THEN 'A84,' END,
        -- Anomali 85
        CASE WHEN (
            art.b4k10 >= 5
            AND r59.b5r51b_value = 1
            AND r59.b5r55a_value IS NULL
            AND asg.assignment_status_id = 2
        ) THEN 'A85,' END,
        -- Anomali 86
        CASE WHEN (
            art.b4k10 >= 5
            AND r59.b5r51b_value = 1
            AND r59.b5r55b_value IS NULL
            AND asg.assignment_status_id = 2
        ) THEN 'A86,' END,
        -- Anomali 88
        CASE WHEN (
            r51.b5r2a_value = r51.b5r1a
            AND (r53.b5r21_value = 4 OR r53.b5r24a_value = 3 OR r53.b5r24b_value = 6 OR r53.b5r24c_value = 3 OR
                r53.b5r24d_value = 6 OR r53.b5r24e_value = 3 OR r53.b5r24f_value = 6 OR r53.b5r24g_value = 3 OR
                r53.b5r24h_value = 6 OR r53.b5r24i_value = 3)
        ) THEN 'A88,' END,
        -- Anomali 89
        CASE WHEN (
            art.b4k10 >= 5
            AND (r53.b5r14b_value = 2310 OR r53.b5r14b_value = 2320 OR r53.b5r14b_value = 2330 OR r53.b5r14b_value = 2341 OR
                r53.b5r14b_value = 2612 OR r53.b5r14b_value = 3152 OR r53.b5r14b_value = 3153 OR r53.b5r14b_value = 3154 OR
                r53.b5r14b_value = 3118 OR r53.b5r14b_value = 3155 OR r53.b5r14b_value = 3315 OR r53.b5r14b_value = 3323 OR
                r53.b5r14b_value = 3351 OR r53.b5r14b_value = 3352 OR r53.b5r14b_value = 3353 OR r53.b5r14b_value = 3359 OR
                r53.b5r14b_value = 4131 OR r53.b5r14b_value = 4211 OR r53.b5r14b_value = 4213 OR r53.b5r14b_value = 4223 OR
                r53.b5r14b_value = 4224 OR (r53.b5r14b_value >= 4311 AND r53.b5r14b_value <= 4419) OR r53.b5r14b_value = 5120 OR
                r53.b5r14b_value = 5411 OR r53.b5r14b_value = 5413 OR r53.b5r14b_value = 5414 OR r53.b5r14b_value = 8311 OR
                r53.b5r14b_value = 8312)
            AND r53.b5r13a_value IS NOT NULL
            AND r53.b5r13a_value <> 4
        ) THEN 'A89,' END,
        -- Anomali 90
        CASE WHEN (
            art.b4k10 >= 5
            AND (r54.b5r32b_value = 2310 OR r54.b5r32b_value = 2320 OR r54.b5r32b_value = 2330 OR r54.b5r32b_value = 2341 OR
                r54.b5r32b_value = 2612 OR r54.b5r32b_value = 3152 OR r54.b5r32b_value = 3153 OR r54.b5r32b_value = 3154 OR
                r54.b5r32b_value = 3118 OR r54.b5r32b_value = 3155 OR r54.b5r32b_value = 3315 OR r54.b5r32b_value = 3323 OR
                r54.b5r32b_value = 3351 OR r54.b5r32b_value = 3352 OR r54.b5r32b_value = 3353 OR r54.b5r32b_value = 3359 OR
                r54.b5r32b_value = 4131 OR r54.b5r32b_value = 4211 OR r54.b5r32b_value = 4213 OR r54.b5r32b_value = 4223 OR
                r54.b5r32b_value = 4224 OR (r54.b5r32b_value >= 4311 AND r54.b5r32b_value <= 4419) OR r54.b5r32b_value = 5120 OR
                r54.b5r32b_value = 5411 OR r54.b5r32b_value = 5413 OR r54.b5r32b_value = 5414 OR r54.b5r32b_value = 8311 OR
                r54.b5r32b_value = 8312)
            AND r54.b5r31a_value IS NOT NULL
            AND r54.b5r31a_value <> 4
        ) THEN 'A90,' END,
        -- Anomali 91
        CASE WHEN (
            art.b4k10 >= 5
            AND (r57.b5r47b_value = 2310 OR r57.b5r47b_value = 2320 OR r57.b5r47b_value = 2330 OR r57.b5r47b_value = 2341 OR
                r57.b5r47b_value = 2612 OR r57.b5r47b_value = 3152 OR r57.b5r47b_value = 3153 OR r57.b5r47b_value = 3154 OR
                r57.b5r47b_value = 3118 OR r57.b5r47b_value = 3155 OR r57.b5r47b_value = 3315 OR r57.b5r47b_value = 3323 OR
                r57.b5r47b_value = 3351 OR r57.b5r47b_value = 3352 OR r57.b5r47b_value = 3353 OR r57.b5r47b_value = 3359 OR
                r57.b5r47b_value = 4131 OR r57.b5r47b_value = 4211 OR r57.b5r47b_value = 4213 OR r57.b5r47b_value = 4223 OR
                r57.b5r47b_value = 4224 OR (r57.b5r47b_value >= 4311 AND r57.b5r47b_value <= 4419) OR r57.b5r47b_value = 5120 OR
                r57.b5r47b_value = 5411 OR r57.b5r47b_value = 5413 OR r57.b5r47b_value = 5414 OR r57.b5r47b_value = 8311 OR
                r57.b5r47b_value = 8312)
            AND r57.b5r46d_value IS NOT NULL
            AND r57.b5r46d_value <> 4
        ) THEN 'A91,' END
       ) as Anomali,
       CONCAT('<a href="https://fasih-sm.bps.go.id/survey-collection/assignment-detail/',
              art.assignment_id
           , '/57563bf6-4077-49c9-b6be-002389adcd91" target="_blank">Link Assignment</a>') AS Link
FROM tlg_ed6f1363.art_roster art
         LEFT JOIN tlg_ed6f1363.root_table r_root
                   ON r_root.assignment_id = art.assignment_id
         LEFT JOIN tlg_ed6f1363.base_table_assignment asg
                ON asg.id = art.assignment_id
         LEFT JOIN tlg_ed6f1363.art_5th_1_roster r51
                   ON r51.assignment_id = art.assignment_id
                       AND r51.index1 = art.index1
         LEFT JOIN tlg_ed6f1363.art_5th_2_roster r52
                   ON r52.assignment_id = art.assignment_id
                       AND r52.index1 = art.index1
         LEFT JOIN tlg_ed6f1363.art_5th_3_roster r53
                   ON r53.assignment_id = art.assignment_id
                       AND r53.index1 = art.index1
         LEFT JOIN tlg_ed6f1363.art_5th_4_roster r54
                   ON r54.assignment_id = art.assignment_id
                       AND r54.index1 = art.index1
         LEFT JOIN tlg_ed6f1363.art_5th_5_roster r55
                   ON r55.assignment_id = art.assignment_id
                       AND r55.index1 = art.index1
         LEFT JOIN tlg_ed6f1363.art_5th_6_roster r56
                   ON r56.assignment_id = art.assignment_id
                       AND r56.index1 = art.index1
         LEFT JOIN tlg_ed6f1363.art_5th_7_roster r57
                   ON r57.assignment_id = art.assignment_id
                       AND r57.index1 = art.index1
         LEFT JOIN tlg_ed6f1363.art_15th_9_roster r59
                   ON r59.assignment_id = art.assignment_id
                       AND r59.index1 = art.index1
        LEFT JOIN (SELECT pair_value, pair_label, assignment_id, index1
                    FROM tlg_ed6f1363.pair_label_value_1
                    WHERE data_key = 'b5r6g1_s'
                      AND pair_value = 'A') b5r6g1_s
                   ON b5r6g1_s.assignment_id = art.assignment_id
                       AND b5r6g1_s.index1 = art.index1
        LEFT JOIN (SELECT pair_value, pair_label, assignment_id, index1
                    FROM tlg_ed6f1363.pair_label_value_1
                    WHERE data_key = 'b5r6g2_s'
                      AND pair_value = 'A') b5r6g2_s
                   ON b5r6g2_s.assignment_id = art.assignment_id
                       AND b5r6g2_s.index1 = art.index1
        LEFT JOIN (SELECT pair_value, pair_label, assignment_id, index1
                    FROM tlg_ed6f1363.pair_label_value_1
                    WHERE data_key = 'b5r6g3_s'
                      AND pair_value = 'A') b5r6g3_s
                   ON b5r6g3_s.assignment_id = art.assignment_id
                       AND b5r6g3_s.index1 = art.index1
ORDER BY art.level_6_full_code, r_root.no_dsrt, art.index1