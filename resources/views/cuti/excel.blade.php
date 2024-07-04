@php
    header('Cache-Control: no-cache, must-revalidate');
    header('Pragma: no-cache');
    header('Content-type: application/x-msexcel');
    header('Content-type: application/octet-stream');
    header('Content-Disposition: attachment; filename=Laporan-Cuti-All.xls');
@endphp
<!DOCTYPE html>
<html>

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Report Cuti</title>
    <style>
        #master td {
            vertical-align: middle;

        }
    </style>
</head>

<body>
    <div style="text-align: center; font-size: 20px;">
        <b>DATA CUTI STAFF</b>
    </div>

    <br>
    <br>

    <table border="1" style="font-size: 14px;width: 50%;">
        <thead>
            <tr style="background-color: royalblue">
                <th>No</th>
                <th>Dibuat Pada</th>
                <th>Staff</th>
                <th>Department</th>
                <th>Tgl. Mulai</th>
                <th>Tgl. Selesai</th>
                <th>Durasi</th>
                <th>Keterangan</th>
                <th>Status</th>
            </tr>
        </thead>
        <tbody>
            @forelse ($cuti as $item)
                <tr style="line-height: 1;">
                    <td>{{ $item->id }}</td>
                    <td>{{ tgl_indo($item->created_at) }}</td>
                    <td>{{ $item->staff->name }}</td>
                    <td>{{ $item->staff->departement->name }}</td>
                    <td>{{ tgl_indo($item->tgl_mulai ?? '') }}</td>
                    <td>{{ tgl_indo($item->tgl_selesai ?? '') }}</td>
                    <td>{{ $item->jumlah_cuti ?? '' }} Hari</td>
                    <td>{{ $item->keterangan }}</td>
                    {!! $item->status == 1
                        ? '<td style="background-color:rgb(47, 158, 47);color:white;text-align:center">Disetujui</td>'
                        : '<td style="background-color:rgb(189, 59, 59);color:white;text-align:center">Ditolak</td>' !!}
                </tr>
            @empty
                <tr>
                    <td class="text-center" colspan="7">Tidak ada data untuk ditampilkan</td>
                </tr>
            @endforelse
        </tbody>
    </table>
</body>

</html>
