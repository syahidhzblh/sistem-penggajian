@extends('layouts.app')
@section('styles')
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/select2@4.0.6-rc.1/dist/css/select2.min.css">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/daterangepicker/daterangepicker.css" />
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-daterangepicker@3.0.3/daterangepicker.css">
@endsection
@section('content')
    <div class="content-wrapper pb-3 pt-3">
        <div class="content pb-5">
            <div class="container-fluid">
                <div class="row justify-content-center">
                    <div class="col-md-12">
                        <div class="card">
                            <div class="card-header">
                                <div class="text-center">
                                    <h3 class="card-title">Tambah User & Staff </h3>
                                </div>
                                <div class="back-top">
                                    <a href="{{ route('master.staff.index') }}" class="btn text-muted">
                                        <i class="fa fa-arrow-left fa-fw"></i></span>
                                    </a>
                                </div>
                            </div>
                            <form action="{{ route('master.staff.store') }}" method="POST" class="form-horizontal"
                                enctype="multipart/form-data">
                                @csrf
                                @include('master.staff._form')
                            </form>
                            <div id="loading"></div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
@endsection

@section('scripts')
    <script src="https://cdn.jsdelivr.net/npm/select2@4.0.6-rc.1/dist/js/select2.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap-daterangepicker@3.0.3/moment.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap-daterangepicker@3.0.3/daterangepicker.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap-daterangepicker@3.0.3/daterangepicker.min.js"></script>
    <script>
        $('.select2').select2({
            placeholder: 'Pilih Data..'
        });

        $('.datepicker').daterangepicker({
            singleDatePicker: true,
            showDropdowns: true,
            autoUpdateInput: true,
            drops: 'up'
        });

        @if ($errors->any())
            $(document).ready(function() {
                var el = document.getElementsByClassName('toggle-form-user')[0];
                if (el.checked) {
                    $('#form-user').show();
                    $('#form-user input').removeAttr('disabled');
                }
            });
        @endif

        $('.toggle-form-user').change(function() {
            $('#form-user').toggle();
            if (this.checked) {
                $('#form-user input').removeAttr('disabled');
                $('#form-user input[type=radio]:last').attr('checked', true);
            } else {
                $('#form-user input').attr('disabled', true);
            }
        });
    </script>
@endsection
