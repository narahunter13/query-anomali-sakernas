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
            AND r53.b5r13a_value = 4
            AND r53.b5r20_value = 1
            AND r53.b5r25a_value = 1
            AND r53.b5r14a_value IS NOT NULL
            AND (r53.b5r14a_value < 84111 OR r53.b5r14a_value > 84300)
        ) THEN 'A1;' END,
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
        ) THEN 'A2;' END,
        -- Anomali 3
        CASE WHEN (
            art.b4k10 >= 5
            AND (r53.b5r14b_value = 2211 OR r53.b5r14b_value = 2212 OR r53.b5r14b_value = 2250 OR r53.b5r14b_value = 2261 OR
                r53.b5r14b_value = 2262 OR r53.b5r14b_value = 2310 OR r53.b5r14b_value = 2330 OR r53.b5r14b_value = 2341 OR
                r53.b5r14b_value = 2411 OR r53.b5r14b_value = 2611 OR r53.b5r14b_value = 2631 OR r53.b5r14b_value = 2632 OR
                r53.b5r14b_value = 2634)
            AND r51.b5r6a_value IS NOT NULL
            AND r51.b5r6a_value < 8
        ) THEN 'A3;' END,
        -- Anomali 4
        CASE WHEN (
            art.b4k10 >= 5
            AND (r53.b5r14b_value = 3351 OR r53.b5r14b_value = 3352 OR r53.b5r14b_value = 3353 OR r53.b5r14b_value = 3354 OR
                r53.b5r14b_value = 3359 OR r53.b5r14b_value = 5411 OR r53.b5r14b_value = 5413 OR r53.b5r14b_value = 8311)
            AND ((r53.b5r13a_value IS NOT NULL AND r53.b5r13a_value <> 4) OR
                (r53.b5r20_value IS NOT NULL AND r53.b5r20_value <> 1) OR
                (r53.b5r14a_value IS NOT NULL AND (r53.b5r14a_value < 84111 OR r53.b5r14a_value > 84300)) OR
                (r51.b5r6a_value IS NOT NULL AND r51.b5r6a_value < 8))
        ) THEN 'A4;' END,
        -- Anomali 5
        CASE WHEN (
            art.b4k10 >= 5
            AND r53.b5r14a_value IS NOT NULL
            AND r53.b5r14a_value >= 05100
            AND r53.b5r16a_value IS NOT NULL
            AND r53.b5r16a_value < 5
        ) THEN 'A5;' END,
        -- Anomali 6
        CASE WHEN (
            art.b4k10 >= 5
            AND r53.b5r14a_value IS NOT NULL
            AND (r53.b5r14a_value >= 01111 AND r53.b5r14a_value <= 03279)
            AND r53.b5r16a_value = 5
        ) THEN 'A6;' END,
        -- Anomali 7
        CASE WHEN (
            art.b4k10 >= 5
            AND r53.b5r14a_value IS NOT NULL
            AND (r53.b5r14a_value >= 01111 AND r53.b5r14a_value <= 01302)
            AND r53.b5r16a_value IS NOT NULL
            AND r53.b5r16a_value > 2
        ) THEN 'A7;' END,
        -- Anomali 8
        CASE WHEN (
            art.b4k10 >= 5
            AND (r53.b5r14a_value = 1111 OR r53.b5r14a_value = 1112 OR r53.b5r14a_value = 1113 OR r53.b5r14a_value = 1121 OR
                r53.b5r14a_value = 1122 OR r53.b5r14a_value = 1135)
            AND r53.b5r16a_value IS NOT NULL
            AND r53.b5r16a_value <> 1
        ) THEN 'A8;' END,
        -- Anomali 9
        CASE WHEN (
            art.b4k10 >= 5
            AND r53.b5r14a_value IS NOT NULL
            AND (r53.b5r14a_value >= 02111 AND r53.b5r14a_value <= 02409)
            AND r53.b5r16a_value IS NOT NULL
            AND r53.b5r16a_value <> 2
        ) THEN 'A9;' END,
        -- Anomali 10
        CASE WHEN (
            art.b4k10 >= 5
            AND r53.b5r14a_value IS NOT NULL
            AND (r53.b5r14a_value >= 01411 AND r53.b5r14a_value <= 01499)
            AND r53.b5r16a_value IS NOT NULL
            AND r53.b5r16a_value <> 3
        ) THEN 'A10;' END,
        -- Anomali 11
        CASE WHEN (
            art.b4k10 >= 5
            AND r53.b5r14a_value IS NOT NULL
            AND (r53.b5r14a_value >= 03111 AND r53.b5r14a_value <= 03279)
            AND r53.b5r16a_value IS NOT NULL
            AND r53.b5r16a_value <> 4
        ) THEN 'A11;' END,
        -- Anomali 12
        CASE WHEN (
            art.b4k10 >= 5
            AND r51.b5r6a_value = 4
            AND r51.b5r6b_j_kd_value IS NOT NULL
            AND (r51.b5r6b_j_kd_value > 4 AND r51.b5r6b_j_kd_value < 998)
        ) THEN 'A12;' END,
        -- Anomali 13
        CASE WHEN (
            art.b4k10 >= 5
            AND (r51.b5r6a_value = 5 OR r51.b5r6a_value = 6)
            AND r51.b5r6b_j_kd_value IS NOT NULL
            AND r51.b5r6b_j_kd_value > 52 
            AND r51.b5r6b_j_kd_value < 998
        ) THEN 'A13;' END,
        -- Anomali 14
        CASE WHEN (
            art.b4k10 >= 5
            AND r51.b5r6a_value = 7
            AND r51.b5r6b_p_value = 4
            AND r51.b5r6b_j_kd_value IS NOT NULL
            AND (r51.b5r6b_j_kd_value <> 999)
        ) THEN 'A14;' END,
        -- Anomali 15
        CASE WHEN (
            art.b4k10 >= 5
            AND r51.b5r6a_value = 8
            AND r51.b5r6b_p_value = 4
            AND r51.b5r6b_j_kd_value IS NOT NULL
            AND (r51.b5r6b_j_kd_value <> 999)
        ) THEN 'A15;' END,
        -- Anomali 16
        CASE WHEN (
            art.b4k10 >= 5
            AND (r51.b5r6a_value >= 9 AND r51.b5r6a_value <= 12)
            AND r51.b5r6b_p_value = 4
            AND r51.b5r6b_j_kd_value IS NOT NULL
            AND (r51.b5r6b_j_kd_value <> 999)
        ) THEN 'A16;' END,
        -- Anomali 17
        CASE WHEN (
            art.b4k10 >= 5
            AND ((r53.b5r14a_value >= 64110 AND r53.b5r14a_value <= 64132) OR
                (r53.b5r14a_value >= 84111 AND r53.b5r14a_value <= 84234) OR r53.b5r14a_value = 99000)
            AND r51.b5r6a_value = 1
        ) THEN 'A17;' END,
        -- Anomali 18
        CASE WHEN (
            art.b4k10 >= 5
            AND (r53.b5r14b_value = 111 OR r53.b5r14b_value = 112 OR r53.b5r14b_value = 113 OR r53.b5r14b_value = 114 OR
                r53.b5r14b_value = 115)
            AND r51.b5r6a_value < 4
        ) THEN 'A18;' END,
        -- Anomali 19
        CASE WHEN (
            art.b4k10 >= 5
            AND (r53.b5r14b_value = 211 OR r53.b5r14b_value = 212 OR r53.b5r14b_value = 213 OR r53.b5r14b_value = 214 OR
                r53.b5r14b_value = 215 OR r53.b5r14b_value = 311 OR r53.b5r14b_value = 312 OR r53.b5r14b_value = 313 OR
                r53.b5r14b_value = 314 OR r53.b5r14b_value = 315)
            AND r51.b5r6a_value < 3
        ) THEN 'A19;' END,
        -- Anomali 20
        CASE WHEN (
            art.b4k10 >= 5
            AND r53.b5r14b_value IS NOT NULL
            AND ((r53.b5r14b_value >= 1111 AND r53.b5r14b_value <= 1112) OR
                (r53.b5r14b_value >= 2111 AND r53.b5r14b_value <= 2356) OR
                (r53.b5r14b_value >= 2411 AND r53.b5r14b_value <= 2643))
            AND r51.b5r6a_value < 4
        ) THEN 'A20;' END,
        -- Anomali 21
        CASE WHEN (
            art.b4k10 >= 5
            AND r53.b5r14b_value IS NOT NULL
            AND (r53.b5r14b_value >= 1113 AND r53.b5r14b_value <= 1431)
            AND r51.b5r6a_value < 2
        ) THEN 'A21;' END,
        -- Anomali 22
        CASE WHEN (
            art.b4k10 >= 5
            AND (r53.b5r14b_value = 111 OR r53.b5r14b_value = 112 OR r53.b5r14b_value = 113 OR r53.b5r14b_value = 114 OR
                r53.b5r14b_value = 115)
            AND art.b4k10 < 18
        ) THEN 'A22;' END,
        -- Anomali 23
        CASE WHEN (
            art.b4k10 >= 5
            AND (r53.b5r14b_value = 211 OR r53.b5r14b_value = 212 OR r53.b5r14b_value = 213 OR r53.b5r14b_value = 214 OR
                r53.b5r14b_value = 215 OR r53.b5r14b_value = 311 OR r53.b5r14b_value = 312 OR r53.b5r14b_value = 313 OR
                r53.b5r14b_value = 314 OR r53.b5r14b_value = 315)
            AND art.b4k10 < 16
        ) THEN 'A23;' END,
        -- Anomali 24
        CASE WHEN (
            art.b4k10 >= 5
            AND ((r53.b5r14b_value >= 1111 AND r53.b5r14b_value <= 1431) OR
                (r53.b5r14b_value >= 2111 AND r53.b5r14b_value <= 2356) OR
                (r53.b5r14b_value >= 2411 AND r53.b5r14b_value <= 2643) OR
                (r53.b5r14b_value >= 3111 AND r53.b5r14b_value <= 3413))
            AND art.b4k10 < 15
        ) THEN 'A24;' END,
        -- Anomali 25
        CASE WHEN (
            art.b4k10 >= 5
            AND r53.b5r14b_value IS NOT NULL
            AND (r53.b5r14b_value = 1311 OR r53.b5r14b_value = 1312 OR r53.b5r14b_value = 3142 OR r53.b5r14b_value = 3143 OR
                (r53.b5r14b_value >= 6111 AND r53.b5r14b_value <= 6340) OR
                (r53.b5r14b_value >= 9211 AND r53.b5r14b_value <= 9216))
            AND r53.b5r14a_value IS NOT NULL
            AND (r53.b5r14a_value < 1111 OR r53.b5r14a_value > 3279)
        ) THEN 'A25;' END,
        -- Anomali 26
        CASE WHEN (
            art.b4k10 >= 5
            AND r53.b5r14a_value IS NOT NULL
            AND ((r53.b5r14b_value >= 111 AND r53.b5r14b_value <= 315) AND (r53.b5r14a_value < 84221 OR r53.b5r14a_value > 84233))
        ) THEN 'A26;' END,
        -- Anomali 27
        CASE WHEN (
            art.b4k10 >= 5
            AND r53.b5r14a_value IS NOT NULL
            AND r53.b5r14b_value = 2320
            AND (r53.b5r14a_value < 85230 OR (r53.b5r14a_value > 85230 AND r53.b5r14a_value < 85240) OR
                (r53.b5r14a_value > 85240 AND r53.b5r14a_value < 85311) OR
                (r53.b5r14a_value > 85312 AND r53.b5r14a_value < 85321) OR r53.b5r14a_value > 85322)
        ) THEN 'A27;' END,
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
        ) THEN 'A28;' END,
        -- Anomali 29
        CASE WHEN (
            art.b4k10 >= 5
            AND r53.b5r13a_value IS NOT NULL
            AND r53.b5r13a_value = 5
            AND r53.b5r14a_value IS NOT NULL
            AND r53.b5r14a_value >= 5100
        ) THEN 'A29;' END,
        -- Anomali 30
        CASE WHEN (
            art.b4k10 >= 5
            AND r53.b5r13a_value IS NOT NULL
            AND r53.b5r13a_value = 6
            AND r53.b5r14a_value IS NOT NULL
            AND ((r53.b5r14a_value >= 1111 AND r53.b5r14a_value <= 3279) OR
                (r53.b5r14a_value >= 84111 AND r53.b5r14a_value <= 84300))
        ) THEN 'A30;' END,
        -- Anomali 31
        CASE WHEN (
            art.b4k10 >= 5
            AND r53.b5r14a_value IS NOT NULL
            AND (r53.b5r14a_value >= 84111 AND r53.b5r14a_value <= 84300)
            AND r53.b5r13a_value IS NOT NULL
            AND r53.b5r13a_value <> 4
        ) THEN 'A31;' END,
        -- Anomali 32
        CASE WHEN (
            art.b4k10 >= 5
            AND r53.b5r14b_value = 2612
            AND r53.b5r14a_value IS NOT NULL
            AND r53.b5r14a_value <> 84233
        ) THEN 'A32;' END,
        -- Anomali 33
        CASE WHEN (
            art.b4k10 >= 5
            AND r53.b5r14a_value IS NOT NULL
            AND (r53.b5r14a_value >= 84111 AND r53.b5r14a_value <= 84300)
            AND r53.b5r13a_value IS NOT NULL
            AND r53.b5r13a_value = 4
            AND art.b4k5_value IS NOT NULL
            AND art.b4k5_value = 2
        ) THEN 'A33;' END,
        -- Anomali 34
        CASE WHEN (
            art.b4k10 >= 5
            AND r53.b5r13a_value = 4
            AND r53.b5r14a_value IS NOT NULL
            AND (r53.b5r14a_value >= 84111 AND r53.b5r14a_value <= 84300)
            AND r53.b5r23a1_value <> 1
        ) THEN 'A34;' END,
        -- Anomali 35
        CASE WHEN (
            art.b4k10 >= 5
            AND r53.b5r14a_value IS NOT NULL
            AND (r53.b5r14a_value >= 84111 AND r53.b5r14a_value <= 84300)
            AND r53.b5r13a_value IS NOT NULL
            AND r53.b5r13a_value = 4
            AND r53.b5r23b_value IS NOT NULL
            AND r53.b5r23b_value <> 1
        ) THEN 'A35;' END,
        -- Anomali 36
        CASE WHEN (
            art.b4k10 >= 5
            AND ((r54.b5r32a_value >= 64110 AND r54.b5r32a_value <= 64132) OR
                (r54.b5r32a_value >= 84111 AND r54.b5r32a_value <= 84234) OR r54.b5r32a_value = 99000)
            AND r51.b5r6a_value = 1
        ) THEN 'A36;' END,
       ) as Anomali,
       CONCAT('<a href="https://fasih-sm.bps.go.id/survey-collection/assignment-detail/',
              art.assignment_id
           , '/57563bf6-4077-49c9-b6be-002389adcd91" target="_blank">Link Assignment</a>') AS Link
FROM tlg_ed6f1363.art_roster art
         LEFT JOIN tlg_ed6f1363.root_table r_root
                   ON r_root.assignment_id = art.assignment_id
         LEFT JOIN tlg_ed6f1363.art_5th_1_roster r51
                   ON r51.assignment_id = art.assignment_id
                       AND r51.index1 = art.index1
         LEFT JOIN tlg_ed6f1363.art_5th_3_roster r53
                   ON r53.assignment_id = art.assignment_id
                       AND r53.index1 = art.index1
         LEFT JOIN tlg_ed6f1363.art_5th_4_roster r54
                   ON r54.assignment_id = art.assignment_id
                       AND r54.index1 = art.index1
ORDER BY art.level_6_full_code, r_root.no_dsrt, art.index1